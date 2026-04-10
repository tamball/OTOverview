import "dart:convert";

import "package:flutter/services.dart";

import "../data/old_testament_sections_data.dart";
import "../models/bible_verse.dart";

/// 從 assets 載入經文。舊約各卷預設為 RCUV 匯出檔（[rcuv_*.json]）；未在 [_fullJson] 註冊者連到占位 JSON。
class BibleRepository {
  BibleRepository._();

  static final BibleRepository instance = BibleRepository._();

  final Map<String, Map<int, List<BibleVerse>>> _books = {};

  static const _fullJson = <String, String>{
    "genesis": "assets/bible/rcuv_genesis.json",
    "exodus": "assets/bible/rcuv_exodus.json",
    "leviticus": "assets/bible/rcuv_leviticus.json",
    "numbers": "assets/bible/rcuv_numbers.json",
    "deuteronomy": "assets/bible/rcuv_deuteronomy.json",
    "joshua": "assets/bible/rcuv_joshua.json",
    "judges": "assets/bible/rcuv_judges.json",
    "ruth": "assets/bible/rcuv_ruth.json",
    "1_samuel": "assets/bible/rcuv_1_samuel.json",
    "2_samuel": "assets/bible/rcuv_2_samuel.json",
    "1_kings": "assets/bible/rcuv_1_kings.json",
    "2_kings": "assets/bible/rcuv_2_kings.json",
    "1_chronicles": "assets/bible/rcuv_1_chronicles.json",
    "2_chronicles": "assets/bible/rcuv_2_chronicles.json",
    "ezra": "assets/bible/rcuv_ezra.json",
    "nehemiah": "assets/bible/rcuv_nehemiah.json",
    "esther": "assets/bible/rcuv_esther.json",
    "job": "assets/bible/rcuv_job.json",
    "psalms": "assets/bible/rcuv_psalms.json",
    "proverbs": "assets/bible/rcuv_proverbs.json",
    "ecclesiastes": "assets/bible/rcuv_ecclesiastes.json",
    "song_of_songs": "assets/bible/rcuv_song_of_songs.json",
    "isaiah": "assets/bible/rcuv_isaiah.json",
    "jeremiah": "assets/bible/rcuv_jeremiah.json",
    "lamentations": "assets/bible/rcuv_lamentations.json",
    "ezekiel": "assets/bible/rcuv_ezekiel.json",
    "daniel": "assets/bible/rcuv_daniel.json",
    "hosea": "assets/bible/rcuv_hosea.json",
    "joel": "assets/bible/rcuv_joel.json",
    "amos": "assets/bible/rcuv_amos.json",
    "obadiah": "assets/bible/rcuv_obadiah.json",
    "jonah": "assets/bible/rcuv_jonah.json",
    "micah": "assets/bible/rcuv_micah.json",
    "nahum": "assets/bible/rcuv_nahum.json",
    "habakkuk": "assets/bible/rcuv_habakkuk.json",
    "zephaniah": "assets/bible/rcuv_zephaniah.json",
    "haggai": "assets/bible/rcuv_haggai.json",
    "zechariah": "assets/bible/rcuv_zechariah.json",
    "malachi": "assets/bible/rcuv_malachi.json",
  };

  static const _emptyPlaceholder =
      "assets/bible/empty_chapters_placeholder.json";

  Future<void> ensureBookLoaded(String bookId) async {
    if (_books.containsKey(bookId)) return;
    final path = _assetPathForBook(bookId);
    if (path == null) {
      _books[bookId] = {};
      return;
    }
    final useSharedPlaceholder = path == _emptyPlaceholder;
    final raw = await rootBundle.loadString(path);
    final map = jsonDecode(raw) as Map<String, dynamic>;
    final chapters = map["chapters"] as Map<String, dynamic>? ?? {};
    final parsed = <int, List<BibleVerse>>{};
    for (final e in chapters.entries) {
      final ch = int.tryParse(e.key);
      if (ch == null) continue;
      final list = e.value as List<dynamic>;
      parsed[ch] = list.map((row) {
        final o = row as Map<String, dynamic>;
        return BibleVerse(
          number: o["v"] as int,
          text: o["t"] as String,
        );
      }).toList();
    }
    if (useSharedPlaceholder) {
      _applyPlaceholderChapterText(bookId, parsed);
    }
    _books[bookId] = parsed;
  }

  /// 共用占位 JSON 的 `chapters` 為空時，為每一章填入說明文字（非經文）。
  void _applyPlaceholderChapterText(
      String bookId, Map<int, List<BibleVerse>> parsed) {
    for (final s in oldTestamentSections) {
      for (final b in s.books) {
        if (b.id != bookId) continue;
        const tail =
            "請將授權譯本以 scripts/import_bible_text.py 或 scripts/import_rcuv_dir_to_assets.py 匯入，"
            "並在 BibleRepository._fullJson 註冊本書 id。";
        for (var ch = 1; ch <= b.chapterCount; ch++) {
          final existing = parsed[ch];
          if (existing != null && existing.isNotEmpty) continue;
          parsed[ch] = [
            BibleVerse(
              number: 1,
              text: "《${b.fullName}》第 $ch 章\n\n【經文待匯入】$tail",
            ),
          ];
        }
        return;
      }
    }
  }

  String? _assetPathForBook(String bookId) {
    final full = _fullJson[bookId];
    if (full != null) return full;
    if (_isOldTestamentCatalogBook(bookId)) return _emptyPlaceholder;
    return null;
  }

  bool _isOldTestamentCatalogBook(String bookId) {
    for (final s in oldTestamentSections) {
      if (s.books.any((b) => b.id == bookId)) return true;
    }
    return false;
  }

  /// 若該章無資料，回傳空列表（非 null）。
  Future<List<BibleVerse>> versesFor(String bookId, int chapter) async {
    await ensureBookLoaded(bookId);
    final book = _books[bookId];
    if (book == null) return [];
    return List.unmodifiable(book[chapter] ?? const []);
  }

  bool hasAssetForBook(String bookId) => _assetPathForBook(bookId) != null;
}
