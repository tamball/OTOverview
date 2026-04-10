import "package:flutter/material.dart";

import "../models/ot_china_timeline_entry.dart";
import "ot_china_timeline_card.dart";

/// 橫向捲動的時間序對照列（左→右為時間先後）。
class OtChinaTimelineHorizontalStrip extends StatelessWidget {
  const OtChinaTimelineHorizontalStrip({
    super.key,
    required this.entries,
    this.height = 500,
    this.cardWidth = 300,
  });

  final List<OtChinaTimelineEntry> entries;
  final double height;
  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Icon(Icons.swipe_rounded, size: 18, color: scheme.onSurfaceVariant),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                "向左滑動，依時間序瀏覽各時段",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: height,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            primary: false,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 8, right: 8),
            itemCount: entries.length,
            separatorBuilder: (_, __) => _StripConnector(color: scheme.outline),
            itemBuilder: (context, i) {
              return OtChinaTimelineCard(
                entry: entries[i],
                horizontalStrip: true,
                stripWidth: cardWidth,
                stripHeight: height,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _StripConnector extends StatelessWidget {
  const _StripConnector({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 3,
              width: 20,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.45),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 4),
            Icon(Icons.arrow_forward_rounded, size: 18, color: color.withValues(alpha: 0.65)),
          ],
        ),
      ),
    );
  }
}
