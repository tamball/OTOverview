import "package:flutter/material.dart";

import "../data/old_testament_sections_data.dart";
import "../learning/learning_badges.dart";
import "../learning/learning_progress_store.dart";

String? _fullNameForBookId(String id) {
  for (final s in oldTestamentSections) {
    for (final b in s.books) {
      if (b.id == id) return b.fullName;
    }
  }
  return null;
}

/// 底部導覽「我的學習」：總進度、徽章、完成紀錄（含日期）。
class MyLearningTab extends StatefulWidget {
  const MyLearningTab({super.key});

  @override
  State<MyLearningTab> createState() => _MyLearningTabState();
}

class _MyLearningTabState extends State<MyLearningTab> {
  Map<String, DateTime> _completions = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    LearningProgressStore.revision.addListener(_onRevision);
    _reload();
  }

  @override
  void dispose() {
    LearningProgressStore.revision.removeListener(_onRevision);
    super.dispose();
  }

  void _onRevision() => _reload();

  Future<void> _reload() async {
    setState(() => _loading = true);
    final m = await LearningProgressStore.allCompletions();
    if (!mounted) return;
    setState(() {
      _completions = m;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final total = LearningProgressStore.totalOtBooks;
    final done = _completions.length;
    final completedIds = _completions.keys.toSet();
    final badges = learningBadgeDefinitions();
    final unlockedCount =
        badges.where((b) => badgeUnlocked(b, completedIds)).length;

    final sortedEntries = _completions.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return RefreshIndicator(
      onRefresh: _reload,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        primary: false,
        slivers: [
          const SliverAppBar.large(
            title: Text("我的學習"),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                if (_loading)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Center(child: CircularProgressIndicator()),
                  )
                else ...[
                  Text(
                    "舊約概覽進度",
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: LinearProgressIndicator(
                      value: total == 0 ? 0 : done / total,
                      minHeight: 10,
                      backgroundColor: scheme.surfaceContainerHighest,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "已完成 $done / $total 卷",
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: scheme.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  if (done > 0 && done < total)
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        "再完成 ${total - done} 卷即可達成「舊約全書」徽章，加油！",
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: scheme.onSurfaceVariant,
                          height: 1.4,
                        ),
                      ),
                    ),
                  if (done == total && total > 0)
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        "你已標記全部 39 卷——太棒了！",
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: scheme.tertiary,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                      ),
                    ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Text(
                        "學習徽章",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: scheme.primary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "$unlockedCount / ${badges.length}",
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: scheme.onSurfaceVariant,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "完成各分部或全書可解鎖對應獎勵。",
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: badges.map((b) {
                      final on = badgeUnlocked(b, completedIds);
                      return _BadgeChip(badge: b, unlocked: on);
                    }).toList(),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    "完成紀錄",
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: scheme.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "依完成日期新到舊排列（於各書「應用默想」分頁標記）。",
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (sortedEntries.isEmpty)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "尚未有紀錄。請到任一卷書最後的「應用默想」分頁，點「標記本卷為已學習完成」即可累積進度與徽章。",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: scheme.onSurfaceVariant,
                            height: 1.45,
                          ),
                        ),
                      ),
                    )
                  else
                    ...sortedEntries.map((e) {
                      final name = _fullNameForBookId(e.key) ?? e.key;
                      final dateStr =
                          LearningProgressStore.formatChineseDate(e.value);
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: scheme.primaryContainer,
                            foregroundColor: scheme.onPrimaryContainer,
                            child: const Icon(Icons.check_rounded),
                          ),
                          title: Text(
                            name,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text("完成日期：$dateStr"),
                        ),
                      );
                    }),
                ],
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _BadgeChip extends StatelessWidget {
  const _BadgeChip({required this.badge, required this.unlocked});

  final LearningBadgeDef badge;
  final bool unlocked;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Tooltip(
      message: "${badge.title}\n${badge.description}",
      child: Material(
        color: unlocked
            ? scheme.secondaryContainer.withValues(alpha: 0.9)
            : scheme.surfaceContainerHighest.withValues(alpha: 0.65),
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          width: 108,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  badge.emoji,
                  style: TextStyle(
                    fontSize: 28,
                    color: unlocked
                        ? null
                        : scheme.onSurface.withValues(alpha: 0.35),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  badge.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: unlocked
                        ? scheme.onSecondaryContainer
                        : scheme.onSurfaceVariant.withValues(alpha: 0.65),
                  ),
                ),
                const SizedBox(height: 4),
                Icon(
                  unlocked
                      ? Icons.verified_rounded
                      : Icons.lock_outline_rounded,
                  size: 18,
                  color: unlocked ? scheme.primary : scheme.outline,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
