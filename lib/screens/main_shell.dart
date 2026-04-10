import "package:flutter/material.dart";

import "../models/ot_section.dart";
import "settings_tab.dart";
import "my_learning_tab.dart";
import "old_testament_landing_page.dart";
import "old_testament_timeline_tab.dart";
import "ot_section_screen.dart";

/// 主框架：預設顯示 [OldTestamentLandingPage]（舊約分部落地頁）。
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  void _openSection(OtSection section) {
    Navigator.of(context).push<void>(
      PageRouteBuilder<void>(
        pageBuilder: (_, __, ___) => OtSectionScreen(section: section),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.02, 0.04),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                  parent: animation, curve: Curves.easeOutCubic)),
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: [
          OldTestamentLandingPage(onOpenSection: _openSection),
          const OldTestamentTimelineTab(),
          const MyLearningTab(),
          const SettingsTab(),
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 10,
        shadowColor: Colors.black45,
        surfaceTintColor: Colors.transparent,
        color: scheme.surfaceContainerHighest,
        child: SafeArea(
          top: false,
          minimum: const EdgeInsets.only(bottom: 2),
          child: NavigationBar(
            height: 72,
            elevation: 0,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            selectedIndex: _index,
            onDestinationSelected: (i) => setState(() => _index = i),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.grid_view_outlined),
                selectedIcon: Icon(Icons.grid_view_rounded),
                label: "舊約總覽",
              ),
              NavigationDestination(
                icon: Icon(Icons.timeline_outlined),
                selectedIcon: Icon(Icons.timeline_rounded),
                label: "舊約時間線",
              ),
              NavigationDestination(
                icon: Icon(Icons.menu_book_outlined),
                selectedIcon: Icon(Icons.menu_book_rounded),
                label: "我的學習",
              ),
              NavigationDestination(
                icon: Icon(Icons.tune_rounded),
                selectedIcon: Icon(Icons.settings_rounded),
                label: "設定",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
