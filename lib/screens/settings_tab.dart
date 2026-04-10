import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:share_plus/share_plus.dart";
import "package:url_launcher/url_launcher.dart";

import "../app_meta.dart";
import "../learning/learning_progress_store.dart";
import "../settings/app_text_scale.dart";
import "../settings/spiritual_mentor_prefs.dart";
import "../widgets/app_credits_sheet.dart";

/// 底部導覽「設定」：屬靈導師、字體、學習備份、關於與意見回報。
class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  final _mentorLabelCtrl = TextEditingController();
  final _mentorEmailCtrl = TextEditingController();
  bool _mentorLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadMentor();
  }

  Future<void> _loadMentor() async {
    final (l, e) = await SpiritualMentorPrefs.load();
    if (!mounted) return;
    _mentorLabelCtrl.text = l;
    _mentorEmailCtrl.text = e;
    setState(() => _mentorLoaded = true);
  }

  @override
  void dispose() {
    _mentorLabelCtrl.dispose();
    _mentorEmailCtrl.dispose();
    super.dispose();
  }

  Future<void> _saveMentor() async {
    final label = _mentorLabelCtrl.text.trim();
    final email = _mentorEmailCtrl.text.trim();
    await SpiritualMentorPrefs.save(label: label, email: email);
    if (!mounted) return;
    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("已儲存屬靈導師資料。")),
    );
  }

  static Uri _feedbackMailtoUri() {
    const subject = "舊約概覽 App 意見";
    const body = "請描述問題或建議（建議註明裝置與系統版本）：\n\n";
    final q =
        "subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}";
    if (kAppFeedbackEmail.isEmpty) {
      return Uri.parse("mailto:?$q");
    }
    return Uri.parse("mailto:$kAppFeedbackEmail?$q");
  }

  Future<void> _openFeedback(BuildContext context) async {
    final uri = _feedbackMailtoUri();
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("無法開啟郵件 App，請改以其他方式聯絡。")),
      );
    }
  }

  Future<void> _exportProgress(BuildContext context) async {
    final json = await LearningProgressStore.exportCompletionsJson();
    if (!context.mounted) return;
    final box = context.findRenderObject();
    final Rect? origin = box is RenderBox && box.hasSize
        ? box.localToGlobal(Offset.zero) & box.size
        : null;
    await SharePlus.instance.share(
      ShareParams(
        text: json,
        subject: "舊約概覽｜學習進度備份",
        title: "舊約概覽｜學習進度備份",
        sharePositionOrigin: origin,
      ),
    );
  }

  Future<void> _copyExport(BuildContext context) async {
    final json = await LearningProgressStore.exportCompletionsJson();
    await Clipboard.setData(ClipboardData(text: json));
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("已複製備份文字到剪貼簿。")),
      );
    }
  }

  Future<void> _showImportDialog(BuildContext context) async {
    final controller = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("匯入學習進度"),
        content: SingleChildScrollView(
          child: TextField(
            controller: controller,
            maxLines: 12,
            decoration: const InputDecoration(
              hintText: "貼上先前匯出或備份的 JSON",
              alignLabelWithHint: true,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text("取消"),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text("匯入"),
          ),
        ],
      ),
    );
    try {
      if (ok == true && context.mounted) {
        final raw = controller.text.trim();
        if (raw.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("內容為空，未匯入。")),
          );
          return;
        }
        await LearningProgressStore.importCompletionsFromJson(raw);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("匯入完成。")),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("匯入失敗：$e")),
        );
      }
    } finally {
      controller.dispose();
    }
  }

  Future<void> _confirmClearProgress(BuildContext context) async {
    final go = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("清除學習進度？"),
        content: const Text(
          "將刪除本機所有「書卷完成」紀錄與相關徽章進度；無法復原，除非你已備份 JSON。",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text("取消"),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(ctx).colorScheme.error,
              foregroundColor: Theme.of(ctx).colorScheme.onError,
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text("全部清除"),
          ),
        ],
      ),
    );
    if (go == true && context.mounted) {
      await LearningProgressStore.clearAllCompletions();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("已清除所有完成紀錄。")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return CustomScrollView(
      primary: false,
      slivers: [
        const SliverAppBar.large(
          title: Text("設定"),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Text(
                "屬靈導師",
                style: theme.textTheme.titleSmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: !_mentorLoaded
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(24),
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "預設稱呼與電郵",
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "儲存後，在書卷「默想筆記」頁可按一次即可開啟電郵（已填收件人與內文）；資料僅存於本裝置。",
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: scheme.onSurfaceVariant,
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: _mentorLabelCtrl,
                              decoration: const InputDecoration(
                                labelText: "導師稱呼（選填）",
                                hintText: "例如：張牧師、小組長",
                                border: OutlineInputBorder(),
                              ),
                              textCapitalization: TextCapitalization.words,
                            ),
                            const SizedBox(height: 12),
                            TextField(
                              controller: _mentorEmailCtrl,
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              decoration: const InputDecoration(
                                labelText: "導師電子郵件",
                                hintText: "例如：pastor@example.org",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            FilledButton.icon(
                              onPressed: _saveMentor,
                              icon: const Icon(Icons.save_rounded),
                              label: const Text("儲存導師資料"),
                            ),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "顯示",
                style: theme.textTheme.titleSmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: AnimatedBuilder(
                    animation: AppTextScale.instance,
                    builder: (context, _) {
                      final s = AppTextScale.instance.scale;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "字體大小",
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "${(s * 100).round()}%",
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: scheme.primary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "影響概覽、經文與多數介面文字；與系統無障礙設定可疊加。",
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: scheme.onSurfaceVariant,
                              height: 1.35,
                            ),
                          ),
                          Slider(
                            value: s,
                            min: AppTextScale.minScale,
                            max: AppTextScale.maxScale,
                            divisions: 20,
                            label: "${(s * 100).round()}%",
                            onChanged: (v) =>
                                AppTextScale.instance.applyScale(v),
                            onChangeEnd: (_) =>
                                AppTextScale.instance.persistScale(),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "學習進度",
                style: theme.textTheme.titleSmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.upload_rounded, color: scheme.primary),
                      title: const Text("匯出備份"),
                      subtitle: const Text("產生 JSON，可分享或自行存檔"),
                      onTap: () => _exportProgress(context),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: Icon(Icons.content_copy_rounded,
                          color: scheme.onSurfaceVariant),
                      title: const Text("複製備份到剪貼簿"),
                      onTap: () => _copyExport(context),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: Icon(Icons.download_rounded,
                          color: scheme.primary),
                      title: const Text("從 JSON 匯入"),
                      subtitle: const Text("會取代目前本機所有完成紀錄"),
                      onTap: () => _showImportDialog(context),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading:
                          Icon(Icons.delete_forever_rounded, color: scheme.error),
                      title: Text(
                        "清除全部紀錄",
                        style: TextStyle(color: scheme.error),
                      ),
                      subtitle: const Text("無法復原，請先匯出備份"),
                      onTap: () => _confirmClearProgress(context),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "關於與回報",
                style: theme.textTheme.titleSmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "舊約概覽",
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "版本 $kAppVersionLabel",
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: scheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            kBibleCopyrightNotice,
                            style: theme.textTheme.bodySmall?.copyWith(
                              height: 1.45,
                              color: scheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "完整致謝、影片來源與技術說明請見「致謝與版權」。",
                            style: theme.textTheme.bodySmall?.copyWith(
                              height: 1.35,
                              color: scheme.outline,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: Icon(Icons.favorite_outline_rounded,
                          color: scheme.primary),
                      title: const Text("致謝與版權"),
                      subtitle: const Text("經文、影片、製作與技術聲明"),
                      onTap: () => showAppCreditsSheet(context),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: Icon(Icons.mail_outline_rounded,
                          color: scheme.primary),
                      title: const Text("意見與勘誤"),
                      subtitle: const Text(
                        "開啟郵件 App 撰寫回報（收件位址不於畫面顯示）",
                      ),
                      onTap: () => _openFeedback(context),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
