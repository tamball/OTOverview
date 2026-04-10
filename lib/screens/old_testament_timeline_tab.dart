import "package:flutter/material.dart";

import "../data/old_testament_china_timeline_data.dart";
import "../widgets/ot_china_timeline_horizontal_strip.dart";

/// 舊約時間序與中國歷史平行對照（依所選書卷篩選相關時代，可多選合併）。
class OldTestamentTimelineTab extends StatefulWidget {
  const OldTestamentTimelineTab({super.key});

  @override
  State<OldTestamentTimelineTab> createState() =>
      _OldTestamentTimelineTabState();
}

class _OldTestamentTimelineTabState extends State<OldTestamentTimelineTab> {
  late final Set<String> _selectedBookIds;

  @override
  void initState() {
    super.initState();
    _selectedBookIds = {otBookIdsForTimeline.first};
  }

  String _selectionHeading() {
    if (_selectedBookIds.isEmpty) return "尚未選擇書卷";
    final labels = _selectedBookIds.map(timelineLabelForBookId).toList();
    if (labels.length <= 4) {
      return "${labels.map((l) => "《$l》").join("")}相關年代對照";
    }
    return "已選 ${labels.length} 卷 · 合併年代對照";
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final filtered = timelineEntriesForBooks(_selectedBookIds);
    final stripHeight =
        (MediaQuery.sizeOf(context).height * 0.52).clamp(430.0, 600.0);

    return CustomScrollView(
      primary: false,
      slivers: [
        const SliverAppBar.large(
          title: Text("舊約 × 中國歷史"),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Card(
                color: scheme.tertiaryContainer.withValues(alpha: 0.45),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.info_outline_rounded, color: scheme.tertiary),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          oldTestamentChinaTimelineDisclaimer,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            height: 1.45,
                            color: scheme.onTertiaryContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "選擇書卷（可多選）",
                style: theme.textTheme.titleSmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "依傳統成書年代通說排序（僅供參考，與正典卷序不同）；多選時下方時間線會合併顯示相關時段。",
                style: theme.textTheme.bodySmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                  height: 1.35,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: otBookIdsForTimeline.map((id) {
                  final selected = _selectedBookIds.contains(id);
                  return FilterChip(
                    label: Text(timelineLabelForBookId(id)),
                    selected: selected,
                    onSelected: (value) {
                      setState(() {
                        if (value) {
                          _selectedBookIds.add(id);
                        } else {
                          _selectedBookIds.remove(id);
                        }
                      });
                    },
                    showCheckmark: true,
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Text(
                _selectionHeading(),
                style: theme.textTheme.titleMedium?.copyWith(
                  color: scheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              if (_selectedBookIds.isEmpty)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      "請至少選擇一卷書，以顯示舊約敘事與中國歷史的對照時間線。",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: scheme.onSurfaceVariant,
                        height: 1.45,
                      ),
                    ),
                  ),
                )
              else if (filtered.isEmpty)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      "所選書卷在目前對照表中沒有對應條目；若你認為應補上某段時代，可回報以便調整。",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: scheme.onSurfaceVariant,
                        height: 1.45,
                      ),
                    ),
                  ),
                )
              else
                OtChinaTimelineHorizontalStrip(
                  entries: filtered,
                  height: stripHeight,
                  cardWidth: 302,
                ),
            ]),
          ),
        ),
      ],
    );
  }
}
