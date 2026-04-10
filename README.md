# bible_overview

聖經「每卷書」概覽 App 骨架：**Material 3**，支援 **iOS + Android**。首頁可進入 **創世記** 範例頁（英雄區、五個 Tab、FAB 閱讀預留、離線提示、本機筆記、測驗）。

## 環境

- 安裝 [Flutter](https://docs.flutter.dev/get-started/install)（穩定版，已含 Dart）。
- Xcode（iOS）與 Android Studio / SDK（Android）。

## 第一次產生平台專案

若資料夾內尚無 `android/`、`ios/`（僅有 `lib/` 與 `pubspec.yaml`），在專案根目錄執行：

```bash
cd /Users/alvintam/pythoncodes/BIBLE/Overview
flutter create . --project-name bible_overview --org com.bible.overview --platforms=android,ios
```

Flutter 會補齊平台檔案，並保留現有的 `lib/` 與 `pubspec.yaml`。

## 執行

```bash
flutter pub get
flutter run
```

## 匯入經文文字到 JSON（本地工具）

新增工具：`scripts/import_bible_text.py`，可把你貼上的章節文字轉成 App 使用的 JSON 結構。

若檔案其實是 **RTF**（內容以 `{\rtf1` 開頭，常見於從 Pages / TextEdit 另存成錯誤格式）：

- **macOS**：腳本會自動用 `textutil` 轉成純文字再解析。
- **其他系統**：請在文書軟體改為「另存純文字 UTF-8 .txt」。

支援行格式：
- `1 起初，神創造天地。`
- `1. 起初，神創造天地。`
- `1:1 起初，神創造天地。`（章:節）

範例（把文字檔匯入創世記第 6 章）：

```bash
cd /Users/alvintam/pythoncodes/BIBLE/Overview
python3 scripts/import_bible_text.py \
  --book-id genesis \
  --chapter 6 \
  --input /path/to/genesis6.txt \
  --output assets/bible/sample_cuv_genesis.json \
  --merge
```

- `--merge`：保留原本章節，只覆蓋目標章。
- 不加 `--merge`：會建立新的 JSON（只含本次章節）。
- `--encoding`：預設 `auto`（依序嘗試 utf-8-sig、utf-8、big5、cp950 等）。若仍失敗，請明確指定，例如 `--encoding big5`。
- `--encoding-errors`：預設 `strict`。若出現 `illegal multibyte sequence` 且你確定檔案是某編碼但偶有壞位元組，可試 `replace`（**無法修復已變成 `?` 的內容**；那代表匯出時中文已丟失，請重新匯出 UTF-8）。

### 批次匯入多章

可用 `--batch` 一次匯入多章（`--batch` 與 `--chapter` 不能同時使用）：

```bash
cd /Users/alvintam/pythoncodes/BIBLE/Overview
python3 scripts/import_bible_text.py \
  --book-id genesis \
  --batch \
  --input /path/to/genesis_bulk.txt \
  --output assets/bible/sample_cuv_genesis.json \
  --merge
```

`genesis_bulk.txt` 可用以下任一方式標示章節：

```text
# chapter 1
1 起初，神創造天地。
2 地是空虛混沌，淵面黑暗。

# chapter 2
1 天地萬物都造齊了。
2 到第七日，神造物的工已經完畢。
```

或直接用 `章:節` 格式（可混用）：

```text
1:1 起初，神創造天地。
1:2 地是空虛混沌，淵面黑暗。
2:1 天地萬物都造齊了。
```

或「單獨一行章號」（常見於某些匯出）：

```text
1
1 起初，神創造天地。
2 地是空虛混沌，淵面黑暗。

2
1 天地萬物都造齊了。
```

### RCUV / Logos 式「同段多節」

若一段裡連寫多節（中間用空白隔開），並用單獨一行數字換章，可加 **`--merge-inline-verses`**：

```bash
python3 scripts/import_bible_text.py \
  --book-id genesis \
  --batch \
  --merge-inline-verses \
  --input /path/to/genesis_rcuv.txt \
  --output assets/bible/sample_cuv_genesis.json \
  --merge
```

- 會略過沒有節號的標題行（例如「上帝的創造」）。
- 第一段經文若屬第 1 章，可不寫單獨的章標題「1」，腳本會自動從第 1 章開始。

## 主要檔案

- `lib/main.dart` — 入口與主題
- `lib/theme/app_theme.dart` — Material 3 色票（藍綠主色、暖橘輔色）
- `lib/screens/main_shell.dart` — 底部導覽（NavigationBar）
- `lib/screens/book_detail_screen.dart` — 單卷書頁（NestedScrollView + Tab）
- `lib/screens/bible_reader_screen.dart` — 閱讀器（章節、字體、assets 經文）
- `lib/bible/bible_repository.dart` — 載入 `assets/bible/` JSON
- `lib/data/genesis_overview_data.dart` — 創世記範例資料

## 套件

- `connectivity_plus`：離線提示
- `shared_preferences`：我的筆記（本機）
- `url_launcher`：Bible Project / 詩歌連結

## 後續可接

- 擴充 `assets/bible/*.json` 或串接授權經文 API（`BibleReaderScreen` 已可讀本地 JSON）
- `share_plus` 分享給小組
- 遠端 JSON / CMS 載入各卷 `BookOverview`
