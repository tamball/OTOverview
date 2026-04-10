import "dart:convert";

import "package:flutter/foundation.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../data/old_testament_sections_data.dart";

/// 本機記錄每卷「學習完成」時間（ISO8601），供進度與徽章使用。
abstract final class LearningProgressStore {
  static const _keyPrefix = "learning_book_completed_";

  /// 變更時遞增，供「我的學習」等畫面 [ValueListenableBuilder] 刷新。
  static final ValueNotifier<int> revision = ValueNotifier(0);

  static void notifyChanged() => revision.value++;

  static List<String> allOtBookIdsOrdered() => [
        for (final s in oldTestamentSections)
          for (final b in s.books) b.id,
      ];

  static int get totalOtBooks => allOtBookIdsOrdered().length;

  static Future<DateTime?> completionDateFor(String bookId) async {
    final prefs = await SharedPreferences.getInstance();
    final s = prefs.getString("$_keyPrefix$bookId");
    if (s == null || s.isEmpty) return null;
    return DateTime.tryParse(s);
  }

  static Future<void> markComplete(String bookId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      "$_keyPrefix$bookId",
      DateTime.now().toIso8601String(),
    );
    notifyChanged();
  }

  static Future<void> clearCompletion(String bookId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("$_keyPrefix$bookId");
    notifyChanged();
  }

  /// 所有已標記完成的書卷 id → 完成時間。
  static Future<Map<String, DateTime>> allCompletions() async {
    final prefs = await SharedPreferences.getInstance();
    final out = <String, DateTime>{};
    for (final k in prefs.getKeys()) {
      if (!k.startsWith(_keyPrefix)) continue;
      final id = k.substring(_keyPrefix.length);
      final s = prefs.getString(k);
      if (s == null) continue;
      final d = DateTime.tryParse(s);
      if (d != null) out[id] = d;
    }
    return out;
  }

  static String formatChineseDate(DateTime d) =>
      "${d.year}年${d.month}月${d.day}日";

  /// JSON：`{ "bookId": "2024-01-01T12:00:00.000", ... }`
  static Future<String> exportCompletionsJson() async {
    final m = await allCompletions();
    final raw = {
      for (final e in m.entries) e.key: e.value.toIso8601String(),
    };
    return const JsonEncoder.withIndent("  ").convert(raw);
  }

  /// 以匯入內容**取代**目前所有完成紀錄（無效項目會略過）。
  static Future<void> importCompletionsFromJson(String json) async {
    final decoded = jsonDecode(json);
    if (decoded is! Map) {
      throw const FormatException("頂層須為 JSON 物件");
    }
    final prefs = await SharedPreferences.getInstance();
    await _clearAllCompletionsWithoutNotify();
    for (final e in decoded.entries) {
      final id = e.key.toString();
      final s = e.value?.toString();
      if (s == null || s.isEmpty) continue;
      if (DateTime.tryParse(s) == null) continue;
      await prefs.setString("$_keyPrefix$id", s);
    }
    notifyChanged();
  }

  static Future<void> clearAllCompletions() async {
    final prefs = await SharedPreferences.getInstance();
    await _removeAllCompletionKeys(prefs);
    notifyChanged();
  }

  static Future<void> _clearAllCompletionsWithoutNotify() async {
    final prefs = await SharedPreferences.getInstance();
    await _removeAllCompletionKeys(prefs);
  }

  static Future<void> _removeAllCompletionKeys(SharedPreferences prefs) async {
    final keys = prefs
        .getKeys()
        .where((k) => k.startsWith(_keyPrefix))
        .toList(growable: false);
    for (final k in keys) {
      await prefs.remove(k);
    }
  }
}
