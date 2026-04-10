import "../models/book_overview.dart";
import "../models/ot_section.dart";
import "book_overview_copy.dart";
import "book_overview_stub.dart";
import "deuteronomy_overview_data.dart";
import "exodus_overview_data.dart";
import "genesis_overview_data.dart";
import "leviticus_overview_data.dart";
import "numbers_overview_data.dart";
import "old_testament_sections_data.dart";
import "ot_book_overview_videos.dart";
import "ot_extended_book_overviews.dart";

/// 已建置完整概覽內容的書卷（摩西五經 + 其餘舊約見 [otExtendedBookOverview]）。
BookOverview? bookOverviewById(String id) {
  switch (id) {
    case "genesis":
      return genesisOverview;
    case "exodus":
      return exodusOverview;
    case "leviticus":
      return leviticusOverview;
    case "numbers":
      return numbersOverview;
    case "deuteronomy":
      return deuteronomyOverview;
    default:
      return otExtendedBookOverview(id);
  }
}

BookOverview _attachPerBookVideosIfNeeded(String bookId, BookOverview raw) {
  final v = kOtBookOverviewVideosById[bookId];
  if (v == null || v.isEmpty || raw.overviewVideos.isNotEmpty) return raw;
  return bookOverviewWithVideos(raw, v);
}

/// 取得書卷導覽資料：舊約各卷皆有概覽；未知 id 時為占位。每卷概覽影片見 [kOtBookOverviewVideosById]。
BookOverview bookOverviewForSectionBook(OtBookRef ref, OtSection section) {
  final raw = bookOverviewById(ref.id) ?? bookOverviewStubForOtBook(ref, section);
  return _attachPerBookVideosIfNeeded(ref.id, raw);
}

/// 依書卷 id 尋找所屬分部（供經文庫等註冊用）。
OtSection? otSectionContainingBook(String bookId) {
  for (final s in oldTestamentSections) {
    if (s.books.any((b) => b.id == bookId)) return s;
  }
  return null;
}
