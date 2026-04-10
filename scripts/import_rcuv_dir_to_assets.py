#!/usr/bin/env python3
"""
將 RCUV/ 目錄內依書卷命名的 .rtf 經文批次轉成 assets/bible/rcuv_<bookId>.json，
並覆寫 lib/bible/bible_repository.dart 內 _fullJson 對照表。

用法（專案根目錄）：
  python3 scripts/import_rcuv_dir_to_assets.py
  python3 scripts/import_rcuv_dir_to_assets.py --rcuv-dir RCUV --dry-run
"""
from __future__ import annotations

import argparse
import re
import subprocess
import sys
from pathlib import Path


# RCUV 檔名（不含副檔名，大小寫不拘）→ App 書卷 id（與 old_testament_sections_data 一致）
RCUV_STEM_TO_BOOK_ID: dict[str, str] = {
    "genesis": "genesis",
    "exodus": "exodus",
    "leviticus": "leviticus",
    "numbers": "numbers",
    "deuteronomy": "deuteronomy",
    "joshua": "joshua",
    "judges": "judges",
    "ruth": "ruth",
    "1 samuel": "1_samuel",
    "2 samuel": "2_samuel",
    "1 king": "1_kings",
    "2 king": "2_kings",
    "1 kings": "1_kings",
    "2 kings": "2_kings",
    "1 chronicles": "1_chronicles",
    "2 chronicles": "2_chronicles",
    "ezra": "ezra",
    "nehemiah": "nehemiah",
    "esther": "esther",
    "job": "job",
    "psalm": "psalms",
    "psalms": "psalms",
    "proverbs": "proverbs",
    "ecclesiastes": "ecclesiastes",
    "song of songs": "song_of_songs",
    "isaiah": "isaiah",
    "jeremiah": "jeremiah",
    "lamentations": "lamentations",
    "ezekiel": "ezekiel",
    "daniel": "daniel",
    "hosea": "hosea",
    "joel": "joel",
    "amos": "amos",
    "obadiah": "obadiah",
    "jonah": "jonah",
    "micah": "micah",
    "nahum": "nahum",
    "habakkuk": "habakkuk",
    "zephaniah": "zephaniah",
    "haggai": "haggai",
    "zechariah": "zechariah",
    "malachi": "malachi",
}

# 舊約書卷在 UI 中的順序（與 old_testament_sections_data 一致）
BOOK_ORDER: list[str] = [
    "genesis",
    "exodus",
    "leviticus",
    "numbers",
    "deuteronomy",
    "joshua",
    "judges",
    "ruth",
    "1_samuel",
    "2_samuel",
    "1_kings",
    "2_kings",
    "1_chronicles",
    "2_chronicles",
    "ezra",
    "nehemiah",
    "esther",
    "job",
    "psalms",
    "proverbs",
    "ecclesiastes",
    "song_of_songs",
    "isaiah",
    "jeremiah",
    "lamentations",
    "ezekiel",
    "daniel",
    "hosea",
    "joel",
    "amos",
    "obadiah",
    "jonah",
    "micah",
    "nahum",
    "habakkuk",
    "zephaniah",
    "haggai",
    "zechariah",
    "malachi",
]


def stem_key(name: str) -> str:
    return Path(name).stem.strip().lower()


def find_rtf_map(rcuv_dir: Path) -> dict[str, Path]:
    """book_id -> rtf path"""
    out: dict[str, Path] = {}
    for p in sorted(rcuv_dir.glob("*.rtf")):
        key = stem_key(p.name)
        bid = RCUV_STEM_TO_BOOK_ID.get(key)
        if bid is None:
            print(f"警告：略過未對照的檔案 {p.name}", file=sys.stderr)
            continue
        if bid in out:
            print(f"警告：書卷 {bid} 重複（{out[bid].name} 與 {p.name}），保留先掃到的", file=sys.stderr)
            continue
        out[bid] = p
    return out


def run_import(script: Path, rtf: Path, book_id: str, out_json: Path, dry: bool) -> bool:
    cmd = [
        sys.executable,
        str(script),
        "--book-id",
        book_id,
        "--batch",
        "--merge-inline-verses",
        "--input",
        str(rtf),
        "--output",
        str(out_json),
        "--translation-note",
        "修訂版中文譯本（RCUV），由 RCUV/*.rtf 經 textutil + import_bible_text.py 匯入；請遵守版權與使用條款。",
    ]
    if dry:
        print("DRY:", " ".join(cmd))
        return True
    out_json.parent.mkdir(parents=True, exist_ok=True)
    r = subprocess.run(cmd, cwd=str(script.parent.parent))
    return r.returncode == 0


def patch_bible_repository(dart_path: Path, book_to_asset: dict[str, str], dry: bool) -> None:
    text = dart_path.read_text(encoding="utf-8")
    start = text.index("static const _fullJson = <String, String>{")
    brace = text.index("{", start)
    depth = 0
    i = brace
    while i < len(text):
        if text[i] == "{":
            depth += 1
        elif text[i] == "}":
            depth -= 1
            if depth == 0:
                end_close = i + 1
                if text[end_close] == ";":
                    end_close += 1
                break
        i += 1
    else:
        raise RuntimeError("找不到 _fullJson 區塊結尾")

    lines = ["  static const _fullJson = <String, String>{"]
    for bid in BOOK_ORDER:
        path = book_to_asset.get(bid)
        if path:
            lines.append(f'    "{bid}": "{path}",')
    lines.append("  };")
    new_block = "\n".join(lines) + "\n"
    new_text = text[:start] + new_block + text[end_close:]
    if dry:
        print("DRY: would write", dart_path)
        return
    dart_path.write_text(new_text, encoding="utf-8")


def main() -> int:
    ap = argparse.ArgumentParser(description="RCUV RTF → assets/bible + BibleRepository")
    ap.add_argument("--rcuv-dir", type=Path, default=Path("RCUV"))
    ap.add_argument("--assets-dir", type=Path, default=Path("assets/bible"))
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    root = Path(__file__).resolve().parent.parent
    rcuv_dir = (root / args.rcuv_dir).resolve()
    assets_dir = (root / args.assets_dir).resolve()
    import_script = root / "scripts" / "import_bible_text.py"
    dart_path = root / "lib" / "bible" / "bible_repository.dart"

    if not rcuv_dir.is_dir():
        print(f"找不到目錄：{rcuv_dir}", file=sys.stderr)
        return 1
    if sys.platform != "darwin":
        print("RTF 轉文字需 macOS textutil；請在 Mac 上執行。", file=sys.stderr)
        return 1

    rtf_by_book = find_rtf_map(rcuv_dir)
    missing = [b for b in BOOK_ORDER if b not in rtf_by_book]
    if missing:
        print(f"警告：以下書卷在 RCUV 目錄缺少對應 .rtf：{', '.join(missing)}", file=sys.stderr)

    book_to_asset: dict[str, str] = {}
    for bid in BOOK_ORDER:
        rtf = rtf_by_book.get(bid)
        if not rtf:
            continue
        rel = f"assets/bible/rcuv_{bid}.json"
        out_json = root / rel
        ok = run_import(import_script, rtf, bid, out_json, args.dry_run)
        if not ok:
            print(f"失敗：{bid} <- {rtf}", file=sys.stderr)
            return 1
        book_to_asset[bid] = rel

    patch_bible_repository(dart_path, book_to_asset, args.dry_run)
    print(f"完成：已處理 {len(book_to_asset)} 卷 → {assets_dir}/rcuv_*.json")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
