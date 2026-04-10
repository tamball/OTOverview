import "../models/book_overview.dart";

/// 複製 [BookOverview] 並覆寫概覽影片（供與 [kOtBookOverviewVideosById] 合併）。
BookOverview bookOverviewWithVideos(
  BookOverview base,
  List<OverviewVideoLink> overviewVideos,
) {
  return BookOverview(
    id: base.id,
    shortName: base.shortName,
    fullName: base.fullName,
    category: base.category,
    chapterCount: base.chapterCount,
    keyTheme: base.keyTheme,
    keyVerses: base.keyVerses,
    backgroundIntro: base.backgroundIntro,
    whyImportant: base.whyImportant,
    keyFigures: base.keyFigures,
    outline: base.outline,
    storyHighlights: base.storyHighlights,
    christConnections: base.christConnections,
    applications: base.applications,
    prayerPrompts: base.prayerPrompts,
    songLinks: base.songLinks,
    quiz: base.quiz,
    overviewVideos: overviewVideos,
    heroGradient: base.heroGradient,
  );
}
