#!/usr/bin/env python3
"""
Convert pasted Bible text into app JSON format.

Single-chapter mode (existing):
  python3 scripts/import_bible_text.py \
    --book-id genesis \
    --chapter 6 \
    --input /path/to/genesis6.txt \
    --output assets/bible/sample_cuv_genesis.json \
    --merge

Batch mode (new):
  python3 scripts/import_bible_text.py \
    --book-id genesis \
    --batch \
    --input /path/to/genesis_all.txt \
    --output assets/bible/sample_cuv_genesis.json \
    --merge

Batch input format:
  # chapter 1
  1 起初，神創造天地。
  2 地是空虛混沌，淵面黑暗。

  # chapter 2
  1 天地萬物都造齊了。
  2 到第七日，神造物的工已經完畢。
"""

from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
from pathlib import Path

VERSE_PATTERNS = [
    re.compile(r"^\s*(\d+)\s*[:：]\s*(\d+)\s+(.+?)\s*$"),  # chapter:verse text
    re.compile(r"^\s*(\d+)\s*[\.、]\s*(.+?)\s*$"),          # verse. text
    re.compile(r"^\s*(\d+)\s+(.+?)\s*$"),                  # verse text
]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Convert Bible plain text to app JSON format."
    )
    parser.add_argument("--book-id", required=True, help="Book id, e.g. genesis")
    parser.add_argument("--chapter", type=int, help="Chapter number for single mode")
    parser.add_argument(
        "--batch",
        action="store_true",
        help="Batch mode: parse multiple chapters in one input file.",
    )
    parser.add_argument("--input", required=True, help="Input text file path")
    parser.add_argument("--output", required=True, help="Output JSON file path")
    parser.add_argument(
        "--translation-note",
        default="匯入自授權來源。請確認版權使用範圍。",
        help="Value written into top-level 'note'.",
    )
    parser.add_argument(
        "--merge",
        action="store_true",
        help="Merge into existing JSON (replace only imported chapters).",
    )
    parser.add_argument(
        "--encoding",
        default="auto",
        help=(
            "輸入檔編碼：auto（自動嘗試 utf-8 / big5 / cp950 等）、"
            "或明確指定如 big5、cp950、gb18030、utf-8-sig。"
        ),
    )
    parser.add_argument(
        "--encoding-errors",
        choices=["strict", "replace", "ignore"],
        default="strict",
        help=(
            "解碼錯誤時：strict 直接失敗；replace 用置換字元略過；ignore 略過無效位元組。"
            "若出現「illegal multibyte sequence」且檔案來自匯出工具，多半是匯出檔已壞，"
            "請改匯出 UTF-8 純文字；仍要硬轉可試 replace（經文可能不完整）。"
        ),
    )
    parser.add_argument(
        "--merge-inline-verses",
        action="store_true",
        help=(
            "批次模式：把「同一段落裡多節連寫」（如「1 … 2 … 3 …」）拆成多行；"
            "略過無節號的標題行（如「上帝的創造」）；"
            "章號仍可單獨一行（如「2」）。並允許第一段經文前省略「1」章標題（自動當第 1 章）。"
        ),
    )
    args = parser.parse_args()
    if args.batch and args.chapter is not None:
        parser.error("--batch 與 --chapter 不可同時使用。")
    if not args.batch and args.chapter is None:
        parser.error("單章模式需提供 --chapter。")
    if args.merge_inline_verses and not args.batch:
        parser.error("--merge-inline-verses 僅能搭配 --batch 使用。")
    return args


def _strip_bom_prefix(data: bytes) -> bytes:
    if data.startswith(b"\xef\xbb\xbf"):
        return data[3:]
    if data.startswith(b"\xff\xfe") or data.startswith(b"\xfe\xff"):
        return data[2:]
    return data


def is_rtf_file(data: bytes) -> bool:
    head = _strip_bom_prefix(data)[:64].lstrip()
    return head.lower().startswith(b"{\\rtf")


def rtf_to_plain_text(path: Path) -> str:
    """將 RTF 轉成純文字。macOS 內建 textutil；其他平台請先手動另存 .txt。"""
    if sys.platform != "darwin":
        raise SystemExit(
            "偵測到輸入為 RTF（Rich Text），例如內容以 {\\rtf1 開頭。\n"
            "請在 Pages / Word / TextEdit 另存為「純文字 UTF-8 .txt」，再執行匯入。\n"
            "或在 macOS 上執行本腳本，會自動用 textutil 轉成文字。"
        )
    resolved = path.resolve()
    result = subprocess.run(
        ["textutil", "-convert", "txt", "-stdout", str(resolved)],
        capture_output=True,
    )
    if result.returncode != 0:
        err = (result.stderr or b"").decode("utf-8", errors="replace")
        raise SystemExit(
            f"textutil 無法轉換 RTF：{resolved}\n{err or '(無 stderr)'}"
        )
    return result.stdout.decode("utf-8", errors="replace")


def read_input_text(
    path: Path, encoding: str, errors: str
) -> tuple[str, str]:
    """回傳 (文字內容, 實際使用的編碼名稱)。"""
    data = path.read_bytes()
    if is_rtf_file(data):
        return rtf_to_plain_text(path), "rtf→txt(textutil)"
    if encoding.lower() != "auto":
        try:
            return data.decode(encoding, errors=errors), encoding
        except UnicodeDecodeError as e:
            raise SystemExit(
                f"無法以 --encoding {encoding} --encoding-errors {errors} 讀取：{path}\n"
                f"錯誤：{e}\n"
                "若錯誤在「數字 1」緊接著出現非法雙位元組（如 position 上是 0xca），"
                "表示檔案裡中文字元已斷裂或匯出失敗，請向來源重新匯出 **UTF-8 純文字**。\n"
                "仍要勉強讀取可試：--encoding-errors replace"
            ) from e

    candidates = [
        "utf-8-sig",
        "utf-8",
        "big5",
        "big5hkscs",
        "cp950",
        "gb18030",
    ]
    if errors == "strict":
        for enc in candidates:
            try:
                return data.decode(enc), enc
            except UnicodeDecodeError:
                continue
        raise SystemExit(
            f"無法自動辨識輸入檔編碼：{path}\n"
            f"已嘗試：{', '.join(candidates)}\n"
            "請明確指定，例如：--encoding big5 或 --encoding cp950\n"
            "若仍失敗，請改匯出 UTF-8；或試 --encoding-errors replace（可能無法還原經文）。"
        )

    best_enc: str | None = None
    best_text: str | None = None
    best_score: int | None = None
    for enc in candidates:
        text = data.decode(enc, errors=errors)
        n_replace = text.count("\ufffd")
        if best_score is None or n_replace < best_score:
            best_score = n_replace
            best_enc = enc
            best_text = text
    assert best_enc is not None and best_text is not None
    return best_text, best_enc


def warn_if_text_likely_corrupt(text: str, path: Path) -> None:
    """匯出檔常見：大量 ? 或 置換字元，代表原文已丟失。"""
    n_q = text.count("?")
    n_rep = text.count("\ufffd")
    n = max(len(text), 1)
    if n_q / n > 0.05 or n_rep / n > 0.01 or "?????" in text[:500]:
        print(
            "警告：內容含大量「?」或置換字元，表示此檔很可能不是有效經文匯出，"
            "請從 Logos / 來源改匯出 **UTF-8 純文字**，或重新複製貼上。\n"
            f"檔案：{path}"
        )


def split_inline_verse_paragraph(line: str) -> list[tuple[int, str]]:
    """
    從一段文字拆出多節，例如 Logos / RCUV 常見格式：
    「1 起初，… 2 地是…」（節號前為行首或空白；節號後為一般空白或窄空白）。
    """
    mark = re.compile(r"(?:^|[\s　])(\d{1,3})[\s\u00a0\u202f　]+")
    matches = list(mark.finditer(line))
    if not matches:
        return []
    out: list[tuple[int, str]] = []
    for i, m in enumerate(matches):
        verse_no = int(m.group(1))
        t0 = m.end()
        t1 = matches[i + 1].start() if i + 1 < len(matches) else len(line)
        frag = line[t0:t1].strip()
        out.append((verse_no, frag))
    return out


def preprocess_merge_inline_verses(raw: str) -> str:
    """將多節連寫段落展開為一行一節，並保留 # chapter N / 單行章號。"""
    chapter_header = re.compile(r"^\s*#\s*chapter\s+(\d+)\s*$", re.IGNORECASE)
    chapter_only = re.compile(r"^\s*(\d{1,3})\s*$")
    out: list[str] = []
    for line in raw.splitlines():
        t = line.strip()
        if not t:
            continue
        if chapter_header.match(t):
            out.append(t)
            continue
        mco = chapter_only.match(t)
        if mco:
            cn = int(mco.group(1))
            if 1 <= cn <= 200:
                out.append(str(cn))
                continue
        pairs = split_inline_verse_paragraph(t)
        if pairs:
            for v, text in pairs:
                out.append(f"{v} {text}")
        # 無節號的標題／說明行略過
    return "\n".join(out) + ("\n" if out else "")


def parse_verse_line(line: str, expected_chapter: int) -> tuple[int, str] | None:
    for pattern in VERSE_PATTERNS:
        match = pattern.match(line)
        if not match:
            continue

        groups = match.groups()
        if len(groups) == 3:
            chapter, verse, text = int(groups[0]), int(groups[1]), groups[2]
            if chapter != expected_chapter:
                return None
            return verse, text.strip()

        verse, text = int(groups[0]), groups[1]
        return verse, text.strip()
    return None


def parse_chapter_text(raw: str, chapter: int) -> list[dict[str, object]]:
    verses: list[dict[str, object]] = []
    seen = set()

    for idx, line in enumerate(raw.splitlines(), start=1):
        line = line.strip()
        if not line:
            continue
        parsed = parse_verse_line(line, chapter)
        if parsed is None:
            # 小標／說明行（如 Logos 匯出）略過
            continue
        verse_no, text = parsed
        if verse_no in seen:
            raise ValueError(f"重複節號：{verse_no}（第 {idx} 行）")
        seen.add(verse_no)
        verses.append({"v": verse_no, "t": text})

    if not verses:
        raise ValueError("沒有解析到任何節。")

    verses.sort(key=lambda x: int(x["v"]))
    return verses


def parse_batch_text(raw: str) -> dict[int, list[dict[str, object]]]:
    chapters: dict[int, list[str]] = {}
    current_chapter: int | None = None

    chapter_header = re.compile(r"^\s*#\s*chapter\s+(\d+)\s*$", re.IGNORECASE)
    # 整行只有章號（部分匯出格式，如 Logos 另存）：「1」「12」
    chapter_only = re.compile(r"^\s*(\d{1,3})\s*$")

    for line in raw.splitlines():
        text = line.strip()
        if not text:
            continue

        head = chapter_header.match(text)
        if head:
            current_chapter = int(head.group(1))
            chapters.setdefault(current_chapter, [])
            continue

        ch_line = chapter_only.match(text)
        if ch_line:
            cn = int(ch_line.group(1))
            if 1 <= cn <= 200:
                current_chapter = cn
                chapters.setdefault(current_chapter, [])
                continue

        first = re.match(r"^\s*(\d+)\s*[:：]\s*(\d+)\s+(.+?)\s*$", text)
        if first:
            ch = int(first.group(1))
            chapters.setdefault(ch, []).append(text)
            current_chapter = ch
            continue

        if current_chapter is None:
            if parse_verse_line(text, 1) is None:
                # 開頭小標／說明（如「上帝的創造」）略過，直到出現第 1 章經文或章標
                continue
            current_chapter = 1
            chapters.setdefault(1, [])

        pvl = parse_verse_line(text, current_chapter)
        if pvl is None:
            # 章內小標、無節號說明行略過（「章:節 經文」已在上方處理並 continue）
            continue

        # 詩篇等匯出有時漏掉單獨一行章號（如缺「35」），下一篇以「1 …」開頭會誤入上一章。
        # 若本行是第 1 節，且當前章已有另一行也是第 1 節，改視為下一章。
        v_no, _ = pvl
        if v_no == 1 and current_chapter is not None:
            bucket = chapters.get(current_chapter, [])
            if any(
                (prev := parse_verse_line(L.strip(), current_chapter)) is not None
                and prev[0] == 1
                for L in bucket
            ):
                current_chapter = current_chapter + 1
                chapters.setdefault(current_chapter, [])

        chapters.setdefault(current_chapter, []).append(text)

    if not chapters:
        raise ValueError("批次模式沒有解析到任何章節內容。")

    parsed: dict[int, list[dict[str, object]]] = {}
    for chapter, lines in sorted(chapters.items()):
        parsed[chapter] = parse_chapter_text("\n".join(lines), chapter)
    return parsed


def load_or_init_json(path: Path, book_id: str, note: str) -> dict[str, object]:
    if not path.exists():
        return {"bookId": book_id, "note": note, "chapters": {}}

    data = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(data, dict):
        raise ValueError("輸出 JSON 根節點必須是物件。")
    if "chapters" not in data or not isinstance(data["chapters"], dict):
        data["chapters"] = {}
    if "bookId" not in data:
        data["bookId"] = book_id
    if "note" not in data:
        data["note"] = note
    return data


def main() -> int:
    args = parse_args()
    in_path = Path(args.input)
    out_path = Path(args.output)

    if not in_path.exists():
        cwd = Path.cwd()
        txt_candidates = sorted(p.name for p in cwd.glob("*.txt"))
        hint = f"目前目錄：{cwd}"
        if txt_candidates:
            hint += f"\n可用 txt 檔：{', '.join(txt_candidates)}"
        hint += "\n請用完整路徑，或先 cd 到輸入檔所在目錄再執行。"
        raise FileNotFoundError(f"找不到輸入檔：{in_path}\n{hint}")

    raw, used_enc = read_input_text(
        in_path, args.encoding, args.encoding_errors
    )
    print(
        f"（輸入檔以 {used_enc} 解碼，encoding_errors={args.encoding_errors}）"
    )
    warn_if_text_likely_corrupt(raw, in_path)

    if args.batch and args.merge_inline_verses:
        raw = preprocess_merge_inline_verses(raw)
        print("（已套用 --merge-inline-verses：段落內多節已拆成一行一節）")

    if args.merge:
        data = load_or_init_json(out_path, args.book_id, args.translation_note)
    else:
        data = {"bookId": args.book_id, "note": args.translation_note, "chapters": {}}

    chapters = data["chapters"]
    assert isinstance(chapters, dict)

    if args.batch:
        parsed_many = parse_batch_text(raw)
        for chapter_no, verses in parsed_many.items():
            chapters[str(chapter_no)] = verses
        count_chapters = len(parsed_many)
        count_verses = sum(len(v) for v in parsed_many.values())
        summary = f"完成：{args.book_id} 批次匯入 {count_chapters} 章，共 {count_verses} 節 -> {out_path}"
    else:
        assert args.chapter is not None
        parsed_verses = parse_chapter_text(raw, args.chapter)
        chapters[str(args.chapter)] = parsed_verses
        summary = f"完成：{args.book_id} 第 {args.chapter} 章，{len(parsed_verses)} 節 -> {out_path}"

    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(
        json.dumps(data, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )

    print(summary)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
