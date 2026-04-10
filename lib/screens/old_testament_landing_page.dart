import "package:flutter/material.dart";

import "../data/old_testament_sections_data.dart";
import "../models/ot_section.dart";
import "../theme/app_theme.dart";
import "../utils/open_overview_videos.dart";
import "../widgets/ot_landing_library.dart";

/// App 開啟時的落地頁：圖書館書架風格，舊約各分部與導論影片。
class OldTestamentLandingPage extends StatelessWidget {
  const OldTestamentLandingPage({
    super.key,
    required this.onOpenSection,
  });

  final void Function(OtSection section) onOpenSection;

  @override
  Widget build(BuildContext context) {
    final parent = Theme.of(context);
    return Theme(
      data: AppTheme.landingThemeOverlay(parent),
      child: Builder(
        builder: (context) {
          final theme = Theme.of(context);
          final scheme = theme.colorScheme;

          return OtLandingWallpaper(
            child: CustomScrollView(
              primary: false,
              slivers: [
                const SliverAppBar.large(
                  title: Text("舊約概覽"),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 28),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.local_library_rounded,
                              color: scheme.primary,
                              size: 26,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "經卷圖書館",
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: scheme.onSurfaceVariant,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "沿書架選擇分部：每層為一類經卷，點擊即可進入書卷與《讀聖經》概覽影片。",
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: scheme.onSurfaceVariant,
                            height: 1.45,
                          ),
                        ),
                        const SizedBox(height: 18),
                        OtLandingIntroPlaque(
                          onTap: () => openOverviewVideos(
                            context,
                            videos: oldTestamentIntroVideos,
                            sheetTitle: "選擇舊約導論影片",
                          ),
                          title: "舊約全覽導論",
                          subtitle: "《讀聖經》TaNaK／舊約結構導論（YouTube）",
                        ),
                        const SizedBox(height: 26),
                        Row(
                          children: [
                            Container(
                              width: 4,
                              height: 22,
                              decoration: BoxDecoration(
                                color: scheme.secondary,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "四層書架",
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: scheme.primary,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "摩西五經 · 歷史書 · 智慧文學 · 先知書",
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: scheme.onSurfaceVariant.withValues(alpha: 0.9),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 14),
                        ...oldTestamentSections.map(
                          (section) => Padding(
                            padding: const EdgeInsets.only(bottom: 14),
                            child: OtLibraryShelfSection(
                              section: section,
                              onTap: () => onOpenSection(section),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
