import "package:flutter/material.dart";

import "../models/book_overview.dart";
import "../models/ot_section.dart";
import "ot_book_overview_videos.dart";

/// 尚未建置完整 tabs 內容的書卷：可進入 [BookDetailScreen] 與閱讀器；概覽影片僅該卷（見 [kOtBookOverviewVideosById]）。
BookOverview bookOverviewStubForOtBook(OtBookRef ref, OtSection section) {
  final bookVideos = kOtBookOverviewVideosById[ref.id] ?? const <OverviewVideoLink>[];
  return BookOverview(
    id: ref.id,
    shortName: ref.shortName,
    fullName: ref.fullName,
    category: section.title,
    chapterCount: ref.chapterCount,
    keyTheme: ref.oneLine ??
        "本卷詳細大綱、人物卡、測驗等尚在擴充；可先觀看本卷概覽影片，並以閱讀器瀏覽已匯入經文。",
    keyVerses: const [],
    backgroundIntro:
        "《${ref.fullName}》屬「${section.title}」。你可使用下方「開始閱讀本書」開啟閱讀器；"
        "若經文檔尚未匯入，畫面會提示待補章節。經文可透過 `scripts/import_bible_text.py` 匯入為 assets/bible/*.json。",
    whyImportant: "舊約每一卷都見證神的性情與救贖計劃，值得按卷慢慢讀。",
    keyFigures: const [],
    outline: const [],
    storyHighlights: const [],
    christConnections: const [],
    applications: const [
      "搭配本卷概覽影片掌握脈絡。",
      "逐章閱讀時可記下問題，日後與導師或小組討論。",
    ],
    prayerPrompts: const [
      "主啊，求祢藉聖靈幫助我讀懂並順服祢的話。",
    ],
    songLinks: const [],
    quiz: const [],
    overviewVideos: bookVideos,
    heroGradient: const [
      Color(0xFF1D3557),
      Color(0xFF457B9D),
      Color(0xFFA8DADC),
    ],
  );
}
