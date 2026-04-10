import "../data/old_testament_sections_data.dart";

/// 可解鎖的學習徽章（依已完成書卷 id 判定）。
class LearningBadgeDef {
  const LearningBadgeDef({
    required this.id,
    required this.title,
    required this.description,
    required this.emoji,
    required this.requiredBookIds,
  });

  final String id;
  final String title;
  final String description;
  final String emoji;
  final Set<String> requiredBookIds;

  bool isUnlocked(Set<String> completedBookIds) =>
      requiredBookIds.every(completedBookIds.contains);
}

Set<String> _bookIdsInSection(String sectionId) {
  final s = oldTestamentSections.firstWhere((x) => x.id == sectionId);
  return s.books.map((b) => b.id).toSet();
}

Set<String> _allOtBookIds() => {
      for (final s in oldTestamentSections)
        for (final b in s.books) b.id
    };

/// 徽章列表（由淺入深）；[first_step] 以「至少完成一卷」解鎖。
List<LearningBadgeDef> learningBadgeDefinitions() {
  final torah = _bookIdsInSection("torah");
  final history = _bookIdsInSection("history");
  final wisdom = _bookIdsInSection("wisdom");
  final prophets = _bookIdsInSection("prophets");
  final all = _allOtBookIds();

  return [
    const LearningBadgeDef(
      id: "first_step",
      title: "起步",
      description: "完成任一卷書的學習標記",
      emoji: "🌱",
      requiredBookIds: {},
    ),
    LearningBadgeDef(
      id: "torah",
      title: "律法入門",
      description: "完成摩西五經全部 5 卷",
      emoji: "📜",
      requiredBookIds: torah,
    ),
    LearningBadgeDef(
      id: "history",
      title: "歷史長河",
      description: "完成歷史書全部 12 卷",
      emoji: "🏛️",
      requiredBookIds: history,
    ),
    LearningBadgeDef(
      id: "wisdom",
      title: "智慧之光",
      description: "完成智慧文學全部 5 卷",
      emoji: "✨",
      requiredBookIds: wisdom,
    ),
    LearningBadgeDef(
      id: "prophets",
      title: "先知之聲",
      description: "完成先知書全部 17 卷",
      emoji: "📣",
      requiredBookIds: prophets,
    ),
    LearningBadgeDef(
      id: "old_testament_complete",
      title: "舊約全書",
      description: "完成舊約全部 39 卷——堅持到底！",
      emoji: "👑",
      requiredBookIds: all,
    ),
  ];
}

bool badgeUnlocked(LearningBadgeDef b, Set<String> completed) {
  if (b.id == "first_step") {
    return completed.isNotEmpty;
  }
  return b.isUnlocked(completed);
}
