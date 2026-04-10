import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../bible/bible_repository.dart";
import "../models/book_overview.dart";
import "../models/bible_verse.dart";

const _kReaderFontSize = "reader_font_size";

/// 簡易聖經閱讀器：捲動經文、上一章／下一章、選章、字體大小（本機記住）。
class BibleReaderScreen extends StatefulWidget {
  const BibleReaderScreen({
    super.key,
    required this.book,
    required this.initialChapter,
  });

  final BookOverview book;
  final int initialChapter;

  @override
  State<BibleReaderScreen> createState() => _BibleReaderScreenState();
}

class _BibleReaderScreenState extends State<BibleReaderScreen> {
  late int _chapter;
  double _fontSize = 18;
  Future<List<BibleVerse>>? _loadFuture;
  final ScrollController _verseScroll = ScrollController();

  BookOverview get book => widget.book;

  @override
  void initState() {
    super.initState();
    _chapter = widget.initialChapter.clamp(1, book.chapterCount);
    _restoreFontSize();
    _reload();
  }

  @override
  void dispose() {
    _verseScroll.dispose();
    super.dispose();
  }

  Future<void> _restoreFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getDouble(_kReaderFontSize);
    if (saved != null && saved >= 14 && saved <= 28 && mounted) {
      setState(() => _fontSize = saved);
    }
  }

  Future<void> _persistFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_kReaderFontSize, _fontSize);
  }

  void _reload() {
    setState(() {
      _loadFuture = BibleRepository.instance.versesFor(book.id, _chapter);
    });
  }

  void _goChapter(int c) {
    final next = c.clamp(1, book.chapterCount);
    if (next == _chapter) return;
    setState(() => _chapter = next);
    _reload();
  }

  Future<void> _pickChapter() async {
    final picked = await showModalBottomSheet<int>(
      context: context,
      showDragHandle: true,
      builder: (ctx) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
                child: Text(
                  "選擇章",
                  style: Theme.of(ctx).textTheme.titleMedium,
                ),
              ),
              Expanded(
                child: GridView.builder(
                  primary: false,
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: book.chapterCount,
                  itemBuilder: (_, i) {
                    final n = i + 1;
                    final selected = n == _chapter;
                    return FilledButton.tonal(
                      style: FilledButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: selected
                            ? Theme.of(ctx).colorScheme.primaryContainer
                            : null,
                      ),
                      onPressed: () => Navigator.pop(ctx, n),
                      child: Text("$n"),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
    if (picked != null) _goChapter(picked);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasAsset = BibleRepository.instance.hasAssetForBook(book.id);

    return Scaffold(
      appBar: AppBar(
        title: Text("${book.fullName}　第 $_chapter 章"),
        actions: [
          IconButton(
            tooltip: "縮小字體",
            onPressed: _fontSize <= 14
                ? null
                : () {
                    setState(() => _fontSize -= 1);
                    _persistFontSize();
                  },
            icon: const Icon(Icons.text_decrease_rounded),
          ),
          IconButton(
            tooltip: "放大字體",
            onPressed: _fontSize >= 28
                ? null
                : () {
                    setState(() => _fontSize += 1);
                    _persistFontSize();
                  },
            icon: const Icon(Icons.text_increase_rounded),
          ),
        ],
      ),
      body: FutureBuilder<List<BibleVerse>>(
        future: _loadFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          final verses = snapshot.data ?? [];
          if (verses.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.article_outlined, size: 48, color: theme.colorScheme.outline),
                    const SizedBox(height: 16),
                    Text(
                      hasAsset
                          ? "本章經文尚未匯入。\n請用 scripts/import_bible_text.py 產出 JSON，或編輯 assets/bible/ 內對應檔案補上第 $_chapter 章。"
                          : "此書卷尚未在 BibleRepository 註冊經文檔。",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Scrollbar(
            controller: _verseScroll,
            child: ListView.separated(
              controller: _verseScroll,
              primary: false,
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
              itemCount: verses.length,
              separatorBuilder: (_, __) => const SizedBox(height: 14),
              itemBuilder: (_, i) {
                final v = verses[i];
                return SelectableText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "${v.number}　",
                        style: TextStyle(
                          fontSize: _fontSize - 1,
                          fontWeight: FontWeight.w700,
                          color: theme.colorScheme.primary,
                          height: 1.5,
                        ),
                      ),
                      TextSpan(
                        text: v.text,
                        style: TextStyle(
                          fontSize: _fontSize,
                          height: 1.55,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Material(
        elevation: 8,
        color: theme.colorScheme.surfaceContainerHigh,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              children: [
                IconButton(
                  tooltip: "上一章",
                  onPressed: _chapter > 1 ? () => _goChapter(_chapter - 1) : null,
                  icon: const Icon(Icons.chevron_left_rounded),
                ),
                Expanded(
                  child: FilledButton.tonal(
                    onPressed: _pickChapter,
                    child: Text("第 $_chapter 章 · 選章"),
                  ),
                ),
                IconButton(
                  tooltip: "下一章",
                  onPressed: _chapter < book.chapterCount ? () => _goChapter(_chapter + 1) : null,
                  icon: const Icon(Icons.chevron_right_rounded),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
