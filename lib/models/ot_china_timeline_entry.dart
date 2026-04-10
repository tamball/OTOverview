/// 舊約敘事與中國歷史大略對照（年代為推估，僅供學習參考）。
class OtChinaTimelineEntry {
  const OtChinaTimelineEntry({
    required this.approxDateLabel,
    required this.otTitle,
    required this.otDetail,
    required this.chinaTitle,
    required this.chinaDetail,
    required this.relatedBookIds,
    this.note,
  });

  /// 例如：約主前 2000–1800 年
  final String approxDateLabel;
  final String otTitle;
  final String otDetail;
  final String chinaTitle;
  final String chinaDetail;
  final String? note;

  /// 與本條對照相關的書卷 id（與 [BookOverview.id] 一致，如 genesis、exodus）。
  /// 空列表表示目前未對應到 App 內書卷（如王國時期以後）。
  final List<String> relatedBookIds;
}
