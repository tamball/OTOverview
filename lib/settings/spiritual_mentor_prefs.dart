import "package:shared_preferences/shared_preferences.dart";

/// 屬靈導師預設稱呼與電郵（本機 [SharedPreferences]，供「設定」與書卷默想分享共用）。
abstract final class SpiritualMentorPrefs {
  static const labelKey = "spiritual_mentor_label";
  static const emailKey = "spiritual_mentor_email";

  static Future<(String label, String email)> load() async {
    final prefs = await SharedPreferences.getInstance();
    return (
      prefs.getString(labelKey) ?? "",
      prefs.getString(emailKey) ?? "",
    );
  }

  static Future<void> save({required String label, required String email}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(labelKey, label);
    await prefs.setString(emailKey, email);
  }
}
