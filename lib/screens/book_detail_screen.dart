import "dart:async";

import "package:connectivity_plus/connectivity_plus.dart";
import "package:flutter/material.dart";
import "package:share_plus/share_plus.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:url_launcher/url_launcher.dart";
import "../data/old_testament_china_timeline_data.dart";
import "../learning/learning_progress_store.dart";
import "../models/book_overview.dart";
import "../settings/spiritual_mentor_prefs.dart";
import "../utils/open_overview_videos.dart";
import "../widgets/ot_china_timeline_horizontal_strip.dart";
import "bible_reader_screen.dart";

class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen({super.key, required this.book});

  final BookOverview book;

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  static const _tabCount = 5;
  final _notesController = TextEditingController();
  StreamSubscription<List<ConnectivityResult>>? _connSub;
  bool _isOffline = false;
  bool _offlineTipDismissed = false;
  bool _notesLoaded = false;
  DateTime? _bookCompletedAt;

  BookOverview get book => widget.book;

  @override
  void initState() {
    super.initState();
    _listenConnectivity();
    _loadNotes();
    _loadBookProgress();
  }

  Future<void> _loadBookProgress() async {
    final d = await LearningProgressStore.completionDateFor(book.id);
    if (mounted) setState(() => _bookCompletedAt = d);
  }

  Future<void> _markBookLearningComplete() async {
    await LearningProgressStore.markComplete(book.id);
    await _loadBookProgress();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("已標記完成！可到「我的學習」查看進度與徽章。"),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _unmarkBookLearningComplete() async {
    await LearningProgressStore.clearCompletion(book.id);
    await _loadBookProgress();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("已取消本卷的完成標記。"),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _listenConnectivity() async {
    final first = await Connectivity().checkConnectivity();
    _applyConnectivity(first);
    _connSub = Connectivity().onConnectivityChanged.listen(_applyConnectivity);
  }

  void _applyConnectivity(List<ConnectivityResult> results) {
    final online = results.any(
      (r) =>
          r == ConnectivityResult.mobile ||
          r == ConnectivityResult.wifi ||
          r == ConnectivityResult.ethernet,
    );
    if (!mounted) return;
    setState(() {
      _isOffline = !online;
      if (online) _offlineTipDismissed = false;
    });
  }

  Future<void> _loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final key = "book_notes_${book.id}";
    final text = prefs.getString(key) ?? "";
    if (!mounted) return;
    _notesController.text = text;
    setState(() => _notesLoaded = true);
  }

  Future<void> _saveNotes() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("book_notes_${book.id}", _notesController.text);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("筆記已儲存")),
    );
  }

  String _formatShareDate(DateTime d) => "${d.year}年${d.month}月${d.day}日";

  String _composeMentorShareText({
    required String mentorTrimmed,
    required String body,
  }) {
    final buf = StringBuffer();
    buf.writeln("【靈修筆記分享】");
    buf.writeln();
    if (mentorTrimmed.isNotEmpty) {
      buf.writeln("$mentorTrimmed，平安：");
      buf.writeln();
    }
    buf.writeln("我想與你分享我在閱讀《${book.fullName}》時的默想記錄：");
    buf.writeln();
    buf.writeln("──────────");
    buf.writeln(body);
    buf.writeln("──────────");
    buf.writeln();
    buf.writeln("日期：${_formatShareDate(DateTime.now())}");
    buf.writeln("（由「舊約概覽」App 整理）");
    return buf.toString();
  }

  Future<void> _deliverShareToMentor({
    required String mentor,
    required String mentorEmail,
    required String body,
  }) async {
    final text = _composeMentorShareText(mentorTrimmed: mentor, body: body);
    final subject = "靈修筆記｜${book.fullName}";

    if (mentorEmail.isNotEmpty) {
      final mailUri = Uri(
        scheme: "mailto",
        path: mentorEmail,
        queryParameters: {"subject": subject, "body": text},
      );
      if (await canLaunchUrl(mailUri)) {
        await launchUrl(mailUri, mode: LaunchMode.externalApplication);
        return;
      }
    }

    if (!mounted) return;
    final ro = context.findRenderObject();
    final Rect? origin = ro is RenderBox && ro.hasSize
        ? ro.localToGlobal(Offset.zero) & ro.size
        : null;

    await SharePlus.instance.share(
      ShareParams(
        text: text,
        subject: subject,
        title: subject,
        sharePositionOrigin: origin,
      ),
    );
  }

  Future<void> _shareNotesWithMentorViaDialog({
    required String initialMentor,
    required String initialEmail,
    required String body,
  }) async {
    final mentorController = TextEditingController(text: initialMentor);
    final mentorEmailController = TextEditingController(text: initialEmail);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("分享給屬靈導師"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "若已在「設定」填寫導師電郵，默想頁會直接開啟郵件。此處可補填或修改，並會一併存回「設定」。",
                  style: Theme.of(ctx).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  "接下來會開啟電郵 App（有填電郵時）或系統分享畫面，以便傳給導師。",
                  style: Theme.of(ctx).textTheme.bodySmall?.copyWith(
                        color: Theme.of(ctx).colorScheme.onSurfaceVariant,
                      ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: mentorController,
                  decoration: const InputDecoration(
                    labelText: "導師稱呼（選填）",
                    hintText: "例如：張牧師、小組長",
                    border: OutlineInputBorder(),
                  ),
                  textCapitalization: TextCapitalization.words,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: mentorEmailController,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    labelText: "導師電子郵件（選填）",
                    hintText: "例如：pastor@example.org",
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text("取消"),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text("寄出／分享"),
            ),
          ],
        );
      },
    );

    final mentor = mentorController.text.trim();
    final mentorEmail = mentorEmailController.text.trim();
    mentorController.dispose();
    mentorEmailController.dispose();

    if (confirmed != true || !mounted) return;
    await SpiritualMentorPrefs.save(label: mentor, email: mentorEmail);
    if (!mounted) return;
    await _deliverShareToMentor(
        mentor: mentor, mentorEmail: mentorEmail, body: body);
  }

  Future<void> _shareNotesWithMentor() async {
    final body = _notesController.text.trim();
    if (body.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("請先寫下靈修筆記，再分享給屬靈導師。")),
      );
      return;
    }

    final (savedMentor, savedMentorEmail) = await SpiritualMentorPrefs.load();
    final mentorEmail = savedMentorEmail.trim();

    if (mentorEmail.isEmpty) {
      if (!mounted) return;
      await _shareNotesWithMentorViaDialog(
        initialMentor: savedMentor,
        initialEmail: savedMentorEmail,
        body: body,
      );
      return;
    }

    if (!mounted) return;
    await _deliverShareToMentor(
      mentor: savedMentor.trim(),
      mentorEmail: mentorEmail,
      body: body,
    );
  }

  @override
  void dispose() {
    _connSub?.cancel();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _openBookOverviewVideos() async {
    if (!mounted) return;
    await openOverviewVideos(
      context,
      videos: book.overviewVideos,
      sheetTitle: "選擇本書概覽影片",
    );
  }

  void _showVerseDialog(KeyVerse v) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (ctx) {
        final t = Theme.of(ctx);
        return Padding(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 8,
            bottom: MediaQuery.paddingOf(ctx).bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(v.reference,
                  style: t.textTheme.titleLarge
                      ?.copyWith(color: t.colorScheme.primary)),
              const SizedBox(height: 16),
              Text("和合本", style: t.textTheme.labelLarge),
              const SizedBox(height: 4),
              Text(v.cuv, style: t.textTheme.bodyLarge),
              const SizedBox(height: 16),
              Text("現代中文譯本（示例）", style: t.textTheme.labelLarge),
              const SizedBox(height: 4),
              Text(v.tncv, style: t.textTheme.bodyLarge),
            ],
          ),
        );
      },
    );
  }

  void _startReading() {
    Navigator.of(context).push<void>(
      PageRouteBuilder<void>(
        pageBuilder: (_, __, ___) =>
            BibleReaderScreen(book: book, initialChapter: 1),
        transitionsBuilder: (_, animation, __, child) {
          const begin = Offset(0.04, 0);
          const end = Offset.zero;
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(begin: begin, end: end).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              ),
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
    return DefaultTabController(
      length: _tabCount,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _startReading,
          icon: const Icon(Icons.auto_stories_rounded),
          label: const Text("開始閱讀本書"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            NestedScrollView(
              headerSliverBuilder: (context, inner) {
                return [
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                      pinned: true,
                      stretch: true,
                      expandedHeight: 248,
                      leading: IconButton(
                        icon: const Icon(Icons.arrow_back_rounded),
                        onPressed: () => Navigator.of(context).maybePop(),
                      ),
                      title: Text(
                        book.fullName,
                        style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w700),
                      ),
                      actions: [
                        IconButton(
                          tooltip: "分享",
                          icon: const Icon(Icons.ios_share_rounded),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("可接 share_plus 分享給小組")),
                            );
                          },
                        ),
                        IconButton(
                          tooltip: "書籤",
                          icon: const Icon(Icons.bookmark_add_outlined),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("已加入書籤（示例）")),
                            );
                          },
                        ),
                      ],
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                        background: _HeroBackdrop(
                          book: book,
                          onVerseTap: _showVerseDialog,
                        ),
                      ),
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(50),
                        child: Material(
                          color: theme.colorScheme.surfaceContainerHigh,
                          surfaceTintColor: Colors.transparent,
                          elevation: 1,
                          shadowColor: Colors.black26,
                          child: TabBar(
                            isScrollable: true,
                            tabAlignment: TabAlignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            labelColor: theme.colorScheme.primary,
                            unselectedLabelColor: theme.colorScheme.onSurface
                                .withValues(alpha: 0.78),
                            indicatorColor: theme.colorScheme.primary,
                            indicatorWeight: 3,
                            dividerColor: theme.colorScheme.outlineVariant,
                            labelStyle: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.15,
                            ),
                            unselectedLabelStyle:
                                theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.15,
                            ),
                            splashBorderRadius: BorderRadius.circular(8),
                            overlayColor: WidgetStateProperty.resolveWith(
                              (states) {
                                if (states.contains(WidgetState.pressed)) {
                                  return theme.colorScheme.primary
                                      .withValues(alpha: 0.10);
                                }
                                return theme.colorScheme.primary
                                    .withValues(alpha: 0.06);
                              },
                            ),
                            tabs: const [
                              Tab(text: "概覽"),
                              Tab(text: "故事 / 大綱"),
                              Tab(text: "指向基督"),
                              Tab(text: "測驗"),
                              Tab(text: "應用默想"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  _TabScaffold(
                    child: _OverviewTab(
                      book: book,
                      onOpenOverviewVideos: () => _openBookOverviewVideos(),
                    ),
                  ),
                  _TabScaffold(
                      child: _StoryTab(
                          book: book, onReadChapter: _startReadingChapter)),
                  _TabScaffold(child: _ChristTab(book: book)),
                  _TabScaffold(child: _QuizTab(book: book)),
                  _TabScaffold(
                    child: _ApplicationTab(
                      book: book,
                      notesController: _notesController,
                      notesLoaded: _notesLoaded,
                      onSaveNotes: _saveNotes,
                      onShareNotesWithMentor: _shareNotesWithMentor,
                      onOpenSong: _openUrl,
                      bookCompletedAt: _bookCompletedAt,
                      onMarkBookLearningComplete: _markBookLearningComplete,
                      onUnmarkBookLearningComplete: _unmarkBookLearningComplete,
                    ),
                  ),
                ],
              ),
            ),
            if (_isOffline && !_offlineTipDismissed)
              Positioned(
                left: 8,
                right: 8,
                bottom: 88,
                child: _OfflineHint(
                  onDismiss: () => setState(() => _offlineTipDismissed = true),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _startReadingChapter(int chapter) {
    Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => BibleReaderScreen(book: book, initialChapter: chapter),
      ),
    );
  }
}

class _TabScaffold extends StatelessWidget {
  const _TabScaffold({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (context) {
          return CustomScrollView(
            primary: false,
            slivers: [
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
                sliver: SliverToBoxAdapter(child: child),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _HeroBackdrop extends StatelessWidget {
  const _HeroBackdrop({required this.book, required this.onVerseTap});

  final BookOverview book;
  final void Function(KeyVerse) onVerseTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final top = MediaQuery.paddingOf(context).top + kToolbarHeight;
    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: book.heroGradient,
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.15),
                Colors.black.withValues(alpha: 0.45),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, top + 8, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  primary: false,
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.shortName,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white.withValues(alpha: 0.95),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        book.keyTheme,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                          height: 1.35,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...book.keyVerses.map(
                        (v) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Material(
                            color: Colors.white.withValues(alpha: 0.14),
                            borderRadius: BorderRadius.circular(12),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () => onVerseTap(v),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            v.reference,
                                            style: theme.textTheme.labelLarge
                                                ?.copyWith(
                                                    color:
                                                        Colors.amber.shade100),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            v.cuv,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.bodyMedium
                                                ?.copyWith(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(Icons.zoom_in_rounded,
                                        color: Colors.white
                                            .withValues(alpha: 0.9)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  Chip(
                    label: Text(book.category),
                    visualDensity: VisualDensity.compact,
                    backgroundColor: Colors.white.withValues(alpha: 0.2),
                    labelStyle:
                        const TextStyle(color: Colors.white, fontSize: 13),
                    side: BorderSide.none,
                  ),
                  Chip(
                    label: Text("${book.chapterCount} 章"),
                    visualDensity: VisualDensity.compact,
                    backgroundColor: Colors.white.withValues(alpha: 0.2),
                    labelStyle:
                        const TextStyle(color: Colors.white, fontSize: 13),
                    side: BorderSide.none,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

List<Widget> _buildBookTimelineSection(
    BuildContext context, BookOverview book) {
  final theme = Theme.of(context);
  final scheme = theme.colorScheme;
  final entries = timelineEntriesForBook(book.id);
  if (entries.isEmpty) return [];

  final stripHeight =
      (MediaQuery.sizeOf(context).height * 0.48).clamp(400.0, 520.0);

  return [
    const SizedBox(height: 20),
    Text(
      "與《${book.fullName}》相關的年代對照",
      style: theme.textTheme.titleMedium?.copyWith(
        color: scheme.primary,
        fontWeight: FontWeight.w700,
      ),
    ),
    const SizedBox(height: 6),
    Text(
      "僅列出與本書敘事相關的條目；向左滑動依時序瀏覽。完整列表請見底部「舊約時間線」。",
      style: theme.textTheme.bodySmall?.copyWith(
        color: scheme.onSurfaceVariant,
        height: 1.4,
      ),
    ),
    const SizedBox(height: 12),
    OtChinaTimelineHorizontalStrip(
      entries: entries,
      height: stripHeight,
      cardWidth: 292,
    ),
  ];
}

class _OverviewTab extends StatelessWidget {
  const _OverviewTab({
    required this.book,
    required this.onOpenOverviewVideos,
  });

  final BookOverview book;
  final VoidCallback onOpenOverviewVideos;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final n = book.overviewVideos.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SectionCard(
          title: "背景簡介",
          child: Text(book.backgroundIntro, style: theme.textTheme.bodyLarge),
        ),
        const SizedBox(height: 12),
        _SectionCard(
          title: "為什麼重要？",
          child: Text(book.whyImportant, style: theme.textTheme.bodyLarge),
        ),
        const SizedBox(height: 12),
        if (n > 0)
          FilledButton.tonalIcon(
            onPressed: onOpenOverviewVideos,
            icon: const Icon(Icons.play_circle_outline_rounded),
            label: Text(
              n == 1 ? "觀看概覽影片（YouTube）" : "選擇概覽影片（$n 支，YouTube）",
            ),
          ),
        ..._buildBookTimelineSection(context, book),
        const SizedBox(height: 20),
        Text("關鍵人物 / 事件", style: theme.textTheme.titleMedium),
        const SizedBox(height: 10),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: book.keyFigures.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, i) {
              final f = book.keyFigures[i];
              return SizedBox(
                width: 200,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(f.emoji, style: const TextStyle(fontSize: 28)),
                        const SizedBox(height: 4),
                        Text(f.name, style: theme.textTheme.titleSmall),
                        const SizedBox(height: 4),
                        Expanded(
                          child: Text(
                            f.oneLiner,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _StoryTab extends StatelessWidget {
  const _StoryTab({required this.book, required this.onReadChapter});

  final BookOverview book;
  final void Function(int chapter) onReadChapter;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("大綱（可展開）", style: theme.textTheme.titleMedium),
        const SizedBox(height: 8),
        ...book.outline.map(
          (s) => Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ExpansionTile(
              tilePadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              title: Text("${s.chapterRange}　${s.title}"),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(s.summary, style: theme.textTheme.bodyLarge),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text("重要故事亮點", style: theme.textTheme.titleMedium),
        const SizedBox(height: 8),
        ...book.storyHighlights.map(
          (h) => Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(h.title, style: theme.textTheme.titleSmall),
                  const SizedBox(height: 6),
                  Text(h.description, style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () => onReadChapter(h.chapter),
                      icon: const Icon(Icons.menu_book_outlined),
                      label: Text("閱讀原文 · ${h.chapterLabel}"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ChristTab extends StatelessWidget {
  const _ChristTab({required this.book});

  final BookOverview book;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final warm = theme.colorScheme.secondaryContainer;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          color: warm,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "舊約如何預表 / 指向耶穌？",
              style: theme.textTheme.titleMedium
                  ?.copyWith(color: theme.colorScheme.onSecondaryContainer),
            ),
          ),
        ),
        const SizedBox(height: 12),
        ...book.christConnections.map(
          (c) => Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          c.otLabel,
                          style: theme.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(Icons.arrow_forward_rounded,
                            color: theme.colorScheme.secondary),
                      ),
                      Expanded(
                        child: Text(c.ntFulfillment,
                            style: theme.textTheme.bodyLarge),
                      ),
                    ],
                  ),
                  if (c.verseRef != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      "經文：${c.verseRef}",
                      style: theme.textTheme.labelLarge
                          ?.copyWith(color: theme.colorScheme.primary),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "「摩西的律法、先知的書，和詩篇上所記的，凡指著我的話都必須應驗。」（路加福音 24:44，意譯提醒）",
          style: theme.textTheme.bodyMedium?.copyWith(
            fontStyle: FontStyle.italic,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "整本舊約都在見證耶穌！",
          style: theme.textTheme.titleSmall
              ?.copyWith(color: theme.colorScheme.secondary),
        ),
      ],
    );
  }
}

class _ApplicationTab extends StatelessWidget {
  const _ApplicationTab({
    required this.book,
    required this.notesController,
    required this.notesLoaded,
    required this.onSaveNotes,
    required this.onShareNotesWithMentor,
    required this.onOpenSong,
    required this.bookCompletedAt,
    required this.onMarkBookLearningComplete,
    required this.onUnmarkBookLearningComplete,
  });

  final BookOverview book;
  final TextEditingController notesController;
  final bool notesLoaded;
  final VoidCallback onSaveNotes;
  final VoidCallback onShareNotesWithMentor;
  final Future<void> Function(String url) onOpenSong;
  final DateTime? bookCompletedAt;
  final Future<void> Function() onMarkBookLearningComplete;
  final Future<void> Function() onUnmarkBookLearningComplete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SectionCard(
          title: "今天我能學到什麼？",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: book.applications
                .map(
                  (a) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("• ", style: theme.textTheme.bodyLarge),
                        Expanded(
                            child: Text(a, style: theme.textTheme.bodyLarge)),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 12),
        _SectionCard(
          title: "祈禱提示",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: book.prayerPrompts
                .map(
                  (p) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(p, style: theme.textTheme.bodyLarge),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 12),
        Text("相關詩歌", style: theme.textTheme.titleMedium),
        const SizedBox(height: 8),
        ...book.songLinks.map(
          (s) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: OutlinedButton.icon(
              onPressed: () => onOpenSong(s.url),
              icon: const Icon(Icons.library_music_outlined),
              label: Text(s.title),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text("我的筆記", style: theme.textTheme.titleMedium),
        const SizedBox(height: 8),
        if (!notesLoaded)
          const LinearProgressIndicator(minHeight: 2)
        else
          TextField(
            controller: notesController,
            maxLines: 6,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "寫下你的默想或禱告重點…",
            ),
          ),
        const SizedBox(height: 10),
        FilledButton(
          onPressed: notesLoaded ? onSaveNotes : null,
          child: const Text("儲存筆記（本機）"),
        ),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          onPressed: notesLoaded ? onShareNotesWithMentor : null,
          icon: const Icon(Icons.share_rounded),
          label: const Text("分享給屬靈導師"),
        ),
        const SizedBox(height: 4),
        Text(
          "在「設定」預填導師電郵後，按此會直接開啟郵件；否則可先填寫再分享。資料僅存本裝置。",
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 20),
        _SectionCard(
          title: "學習進度",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (bookCompletedAt != null) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check_circle_rounded,
                        color: theme.colorScheme.primary, size: 26),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "已於 ${LearningProgressStore.formatChineseDate(bookCompletedAt!)} 標記為學習完成。",
                        style:
                            theme.textTheme.bodyLarge?.copyWith(height: 1.45),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () => onUnmarkBookLearningComplete(),
                  child: const Text("取消完成標記"),
                ),
              ] else ...[
                Text(
                  "讀完本卷內容並完成默想後，可在此標記完成，以累積「我的學習」進度與徽章獎勵。",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: () => onMarkBookLearningComplete(),
                  icon: const Icon(Icons.emoji_events_outlined),
                  label: const Text("標記本卷為已學習完成"),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _QuizTab extends StatefulWidget {
  const _QuizTab({required this.book});

  final BookOverview book;

  @override
  State<_QuizTab> createState() => _QuizTabState();
}

class _QuizTabState extends State<_QuizTab> {
  late List<int?> _answers;
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _answers = List<int?>.filled(widget.book.quiz.length, null);
  }

  List<QuizQuestion> get _questions => widget.book.quiz;

  void _pick(int choice) {
    setState(() {
      _answers[_current] = choice;
    });
    final q = _questions[_current];
    final correct = choice == q.correctIndex;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(correct ? "答對了！${q.feedback}" : "再想想看：${q.feedback}"),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  bool get _allDone => _answers.every((a) => a != null);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (_questions.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            "本卷測驗題尚在籌備；可先使用「開始閱讀本書」與「應用默想」筆記。",
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
        ),
      );
    }
    final q = _questions[_current];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text("第 ${_current + 1} / ${_questions.length} 題",
                style: theme.textTheme.titleSmall),
            const Spacer(),
            if (_allDone)
              Icon(Icons.celebration_rounded,
                  color: theme.colorScheme.secondary, size: 28),
          ],
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(q.question, style: theme.textTheme.titleSmall),
          ),
        ),
        const SizedBox(height: 12),
        ...List.generate(q.choices.length, (i) {
          final selected = _answers[_current] == i;
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: FilledButton.tonal(
              style: FilledButton.styleFrom(
                alignment: Alignment.centerLeft,
                backgroundColor:
                    selected ? theme.colorScheme.secondaryContainer : null,
              ),
              onPressed: () => _pick(i),
              child: Text(q.choices[i]),
            ),
          );
        }),
        const SizedBox(height: 8),
        Row(
          children: [
            TextButton(
              onPressed: _current > 0 ? () => setState(() => _current--) : null,
              child: const Text("上一題"),
            ),
            const Spacer(),
            TextButton(
              onPressed: _current < _questions.length - 1
                  ? () => setState(() => _current++)
                  : null,
              child: const Text("下一題"),
            ),
          ],
        ),
        if (_allDone) ...[
          const SizedBox(height: 12),
          Card(
            color: theme.colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "恭喜！你已掌握 ${widget.book.shortName} 的重點！可到「應用默想」分頁底部標記本卷完成以解鎖徽章，並在「我的學習」查看紀錄。",
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _OfflineHint extends StatelessWidget {
  const _OfflineHint({required this.onDismiss});

  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(12),
      color: theme.colorScheme.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Icon(Icons.offline_pin_rounded, color: theme.colorScheme.primary),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                "目前離線；內容已下載時可繼續瀏覽",
                style: theme.textTheme.bodyMedium,
              ),
            ),
            IconButton(
              onPressed: onDismiss,
              icon: const Icon(Icons.close_rounded),
              tooltip: "關閉",
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: theme.textTheme.titleSmall
                    ?.copyWith(color: theme.colorScheme.primary)),
            const SizedBox(height: 10),
            child,
          ],
        ),
      ),
    );
  }
}
