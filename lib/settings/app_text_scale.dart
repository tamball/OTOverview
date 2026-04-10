import "package:flutter/foundation.dart";
import "package:shared_preferences/shared_preferences.dart";

/// 全域正文字體縮放（透過 [MaterialApp.builder] 套用 [TextScaler.linear]）。
final class AppTextScale extends ChangeNotifier {
  AppTextScale._();
  static final AppTextScale instance = AppTextScale._();

  static const _prefKey = "app_text_scale";

  static const double minScale = 0.88;
  static const double maxScale = 1.28;
  static const double defaultScale = 1.0;

  double _scale = defaultScale;
  double get scale => _scale;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final v = prefs.getDouble(_prefKey);
    if (v != null && v >= minScale && v <= maxScale && (v - _scale).abs() > 0.0001) {
      _scale = v;
      notifyListeners();
    }
  }

  /// 拖曳滑桿時呼叫（不寫入磁碟，避免每幀 I/O）。
  void applyScale(double value) {
    final c = value.clamp(minScale, maxScale);
    if ((c - _scale).abs() < 0.0001) return;
    _scale = c;
    notifyListeners();
  }

  Future<void> persistScale() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_prefKey, _scale);
  }

  Future<void> setScale(double value) async {
    applyScale(value);
    await persistScale();
  }
}
