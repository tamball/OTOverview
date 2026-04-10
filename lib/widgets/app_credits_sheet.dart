import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

import "../app_meta.dart";

/// 設定頁「致謝與版權」完整內容（底部滑出）。
Future<void> showAppCreditsSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (ctx) {
      final theme = Theme.of(ctx);
      final scheme = theme.colorScheme;
      final bottom = MediaQuery.paddingOf(ctx).bottom;
      final maxH = MediaQuery.sizeOf(ctx).height * 0.82;

      Widget section(String title, String body, {Widget? trailing}) {
        if (body.trim().isEmpty && trailing == null) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: scheme.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              if (body.trim().isNotEmpty) ...[
                const SizedBox(height: 6),
                Text(
                  body.trim(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    height: 1.45,
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ],
              if (trailing != null) ...[
                const SizedBox(height: 8),
                trailing,
              ],
            ],
          ),
        );
      }

      return SizedBox(
        height: maxH,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 20, 16 + bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "致謝與版權",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: scheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "舊約概覽 · 版本 $kAppVersionLabel",
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (kAppCreditAuthor.trim().isNotEmpty)
                          section(
                            "製作與策劃",
                            kAppCreditAuthor.trim(),
                            trailing: kAppCreditAuthorUrl.trim().isNotEmpty
                                ? Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextButton.icon(
                                      onPressed: () async {
                                        final u = Uri.tryParse(
                                          kAppCreditAuthorUrl.trim(),
                                        );
                                        if (u == null ||
                                            !(u.isScheme("http") ||
                                                u.isScheme("https"))) {
                                          if (ctx.mounted) {
                                            ScaffoldMessenger.of(ctx)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text("網址格式不正確。"),
                                              ),
                                            );
                                          }
                                          return;
                                        }
                                        if (await canLaunchUrl(u)) {
                                          await launchUrl(
                                            u,
                                            mode: LaunchMode
                                                .externalApplication,
                                          );
                                        } else if (ctx.mounted) {
                                          ScaffoldMessenger.of(ctx)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text("無法開啟此連結。"),
                                            ),
                                          );
                                        }
                                      },
                                      icon: const Icon(Icons.link_rounded,
                                          size: 18),
                                      label: const Text("相關連結"),
                                    ),
                                  )
                                : null,
                          ),
                        section("聖經經文", kBibleCopyrightNotice),
                        section("影片與外部內容", kAppCreditVideoAttribution),
                        if (kAppCreditDataAttribution.trim().isNotEmpty)
                          section(
                              "資料與編輯", kAppCreditDataAttribution.trim()),
                        section("技術", kAppCreditTechAttribution),
                        const SizedBox(height: 8),
                        Text(
                          "若需更正署名、補充來源或撤下連結，請透過「意見與勘誤」與我們聯絡。",
                          style: theme.textTheme.bodySmall?.copyWith(
                            height: 1.4,
                            color: scheme.outline,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
