import "package:flutter/material.dart";

import "../models/ot_china_timeline_entry.dart";

/// 單筆「舊約 × 中國歷史」對照卡（供時間線分頁與書卷概覽共用）。
class OtChinaTimelineCard extends StatelessWidget {
  const OtChinaTimelineCard({
    super.key,
    required this.entry,
    this.horizontalStrip = false,
    this.stripWidth = 300,
    this.stripHeight = 480,
  });

  final OtChinaTimelineEntry entry;

  /// 為 true 時固定寬高，內文可直向捲動，供橫向時間軸使用。
  final bool horizontalStrip;
  final double stripWidth;
  final double stripHeight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    final header = Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      color: scheme.primaryContainer.withValues(alpha: 0.65),
      child: Text(
        entry.approxDateLabel,
        style: theme.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w800,
          color: scheme.onPrimaryContainer,
          letterSpacing: 0.2,
        ),
      ),
    );

    final body = Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Lane(
            icon: Icons.menu_book_rounded,
            label: "舊約敘事",
            title: entry.otTitle,
            body: entry.otDetail,
            accent: scheme.primary,
            fill: scheme.primaryContainer.withValues(alpha: 0.25),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: Divider(color: scheme.outlineVariant)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.compare_arrows_rounded,
                  size: 20,
                  color: scheme.outline,
                ),
              ),
              Expanded(child: Divider(color: scheme.outlineVariant)),
            ],
          ),
          const SizedBox(height: 12),
          _Lane(
            icon: Icons.public_rounded,
            label: "中國歷史（大略）",
            title: entry.chinaTitle,
            body: entry.chinaDetail,
            accent: scheme.tertiary,
            fill: scheme.tertiaryContainer.withValues(alpha: 0.35),
          ),
          if (entry.note != null) ...[
            const SizedBox(height: 10),
            Text(
              entry.note!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: scheme.onSurfaceVariant,
                fontStyle: FontStyle.italic,
                height: 1.4,
              ),
            ),
          ],
        ],
      ),
    );

    final card = Card(
      clipBehavior: Clip.antiAlias,
      child: horizontalStrip
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                header,
                Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: body,
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [header, body],
            ),
    );

    if (horizontalStrip) {
      return SizedBox(
        width: stripWidth,
        height: stripHeight,
        child: card,
      );
    }
    return card;
  }
}

class _Lane extends StatelessWidget {
  const _Lane({
    required this.icon,
    required this.label,
    required this.title,
    required this.body,
    required this.accent,
    required this.fill,
  });

  final IconData icon;
  final String label;
  final String title;
  final String body;
  final Color accent;
  final Color fill;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: fill,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accent.withValues(alpha: 0.35)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 18, color: accent),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: accent,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              body,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
            ),
          ],
        ),
      ),
    );
  }
}
