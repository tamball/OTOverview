import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";
import "package:youtube_player_iframe/youtube_player_iframe.dart";

import "../models/book_overview.dart";
import "youtube_url.dart";

/// 在 youtube.com/watch 網址加上 autoplay。
String youTubeWatchWithAutoplay(String watchUrl) {
  final uri = Uri.tryParse(watchUrl);
  if (uri == null) return watchUrl;
  final host = uri.host.toLowerCase();
  if (!host.endsWith("youtube.com")) return watchUrl;
  if (!uri.path.contains("watch")) return watchUrl;
  final q = Map<String, String>.from(uri.queryParameters);
  q["autoplay"] = "1";
  return uri.replace(queryParameters: q).toString();
}

/// 播放概覽影片（單支直開、多支先選）；與書卷詳情頁邏輯相同。
Future<void> openOverviewVideos(
  BuildContext context, {
  required List<OverviewVideoLink> videos,
  String sheetTitle = "選擇概覽影片",
}) async {
  if (videos.isEmpty) return;

  OverviewVideoLink chosen;
  if (videos.length == 1) {
    chosen = videos.single;
  } else {
    final picked = await showModalBottomSheet<OverviewVideoLink>(
      context: context,
      showDragHandle: true,
      builder: (ctx) {
        final t = Theme.of(ctx);
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                  child: Text(sheetTitle, style: t.textTheme.titleMedium),
                ),
                for (var i = 0; i < videos.length; i++) ...[
                  if (i > 0) const Divider(height: 1),
                  ListTile(
                    title: Text(videos[i].title),
                    trailing: const Icon(Icons.play_circle_outline),
                    onTap: () => Navigator.pop(ctx, videos[i]),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
    if (picked == null || !context.mounted) return;
    chosen = picked;
  }

  final videoId = youtubeVideoIdFromUrl(chosen.url);
  if (videoId != null && context.mounted) {
    await FullscreenYoutubePlayer.launch(context, videoId: videoId);
    return;
  }
  if (!context.mounted) return;
  final uri = Uri.parse(youTubeWatchWithAutoplay(chosen.url));
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

Future<void> openYoutubeUrlExternal(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
