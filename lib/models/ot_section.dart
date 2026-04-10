import "book_overview.dart";
import "../data/read_bible_playlist.dart";

/// 舊約分部（摩西五經、歷史書等）與所屬書卷。
class OtBookRef {
  const OtBookRef({
    required this.id,
    required this.shortName,
    required this.fullName,
    required this.chapterCount,
    this.oneLine,
  });

  final String id;
  final String shortName;
  final String fullName;
  final int chapterCount;
  final String? oneLine;
}

class OtSection {
  const OtSection({
    required this.id,
    required this.title,
    required this.description,
    required this.overviewVideos,
    required this.books,
    this.playlistUrl = readBibleOldTestamentPlaylistUrl,
  });

  final String id;
  final String title;
  final String description;
  final List<OverviewVideoLink> overviewVideos;
  final List<OtBookRef> books;

  /// 預設為《讀聖經》舊約完整播放清單。
  final String playlistUrl;
}
