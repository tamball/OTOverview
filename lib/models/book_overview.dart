import "package:flutter/material.dart";

class KeyVerse {
  const KeyVerse({
    required this.reference,
    required this.cuv,
    required this.tncv,
  });

  final String reference;
  final String cuv;
  final String tncv;
}

class OutlineSection {
  const OutlineSection({
    required this.chapterRange,
    required this.title,
    required this.summary,
  });

  final String chapterRange;
  final String title;
  final String summary;
}

class StoryHighlight {
  const StoryHighlight({
    required this.title,
    required this.description,
    required this.chapterLabel,
    required this.chapter,
  });

  final String title;
  final String description;
  final String chapterLabel;
  final int chapter;
}

class ChristConnection {
  const ChristConnection({
    required this.otLabel,
    required this.ntFulfillment,
    this.verseRef,
  });

  final String otLabel;
  final String ntFulfillment;
  final String? verseRef;
}

class QuizQuestion {
  const QuizQuestion({
    required this.question,
    required this.choices,
    required this.correctIndex,
    required this.feedback,
  });

  final String question;
  final List<String> choices;
  final int correctIndex;
  final String feedback;
}

class KeyFigure {
  const KeyFigure({
    required this.name,
    required this.oneLiner,
    required this.emoji,
  });

  final String name;
  final String oneLiner;
  final String emoji;
}

class SongLink {
  const SongLink({required this.title, required this.url});

  final String title;
  final String url;
}

/// 書卷概覽影片（《讀聖經》舊約系列等）；可多則由使用者挑選。
class OverviewVideoLink {
  const OverviewVideoLink({required this.title, required this.url});

  final String title;
  final String url;
}

class BookOverview {
  const BookOverview({
    required this.id,
    required this.shortName,
    required this.fullName,
    required this.category,
    required this.chapterCount,
    required this.keyTheme,
    required this.keyVerses,
    required this.backgroundIntro,
    required this.whyImportant,
    required this.keyFigures,
    required this.outline,
    required this.storyHighlights,
    required this.christConnections,
    required this.applications,
    required this.prayerPrompts,
    required this.songLinks,
    required this.quiz,
    this.overviewVideos = const [],
    this.heroGradient = const [
      Color(0xFF0D5C63),
      Color(0xFF2A9D8F),
      Color(0xFF8ECAE6),
    ],
  });

  final String id;
  final String shortName;
  final String fullName;
  final String category;
  final int chapterCount;
  final String keyTheme;
  final List<KeyVerse> keyVerses;
  final String backgroundIntro;
  final String whyImportant;
  final List<KeyFigure> keyFigures;
  final List<OutlineSection> outline;
  final List<StoryHighlight> storyHighlights;
  final List<ChristConnection> christConnections;
  final List<String> applications;
  final List<String> prayerPrompts;
  final List<SongLink> songLinks;
  final List<QuizQuestion> quiz;
  final List<OverviewVideoLink> overviewVideos;
  final List<Color> heroGradient;
}
