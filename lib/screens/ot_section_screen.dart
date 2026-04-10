import "package:flutter/material.dart";

import "../data/book_overview_lookup.dart";
import "../models/ot_section.dart";
import "../utils/open_overview_videos.dart";
import "../widgets/book_entry_tile.dart";
import "book_detail_screen.dart";

class OtSectionScreen extends StatelessWidget {
  const OtSectionScreen({super.key, required this.section});

  final OtSection section;

  void _openBook(BuildContext context, OtBookRef ref) {
    final book = bookOverviewForSectionBook(ref, section);
    Navigator.of(context).push<void>(
      PageRouteBuilder<void>(
        pageBuilder: (_, __, ___) => BookDetailScreen(book: book),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.02, 0.04),
                end: Offset.zero,
              ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text(section.title),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  section.description,
                  style: theme.textTheme.bodyLarge?.copyWith(height: 1.45),
                ),
                const SizedBox(height: 16),
                FilledButton.tonalIcon(
                  onPressed: section.overviewVideos.isEmpty
                      ? null
                      : () => openOverviewVideos(
                            context,
                            videos: section.overviewVideos,
                            sheetTitle: "選擇「${section.title}」概覽影片",
                          ),
                  icon: const Icon(Icons.play_circle_outline_rounded),
                  label: Text(
                    section.overviewVideos.length == 1
                        ? "觀看分部概覽影片"
                        : "選擇概覽影片（${section.overviewVideos.length} 支）",
                  ),
                ),
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  onPressed: () => openYoutubeUrlExternal(section.playlistUrl),
                  icon: const Icon(Icons.playlist_play_rounded),
                  label: const Text("《讀聖經》舊約完整播放清單"),
                ),
                const SizedBox(height: 8),
                Text(
                  "影片來源：《讀聖經》舊約系列（YouTube）。",
                  style: theme.textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
                ),
                const SizedBox(height: 24),
                Text(
                  "書卷列表（${section.books.length} 卷）",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: scheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                ...section.books.map(
                  (b) => BookEntryTile(
                    shortName: b.shortName,
                    fullName: b.fullName,
                    subtitle: b.oneLine ?? "${b.chapterCount} 章",
                    onTap: () => _openBook(context, b),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
