import "../models/book_overview.dart";
import "ot_overview_history_books.dart";
import "ot_overview_prophets_books.dart";
import "ot_overview_wisdom_books.dart";

/// 歷史書、智慧文學、先知書的完整 [BookOverview]（摩西五經見各 `*_overview_data.dart`）。
BookOverview? otExtendedBookOverview(String id) {
  return historyOtBookOverview(id) ?? wisdomOtBookOverview(id) ?? prophetsOtBookOverview(id);
}
