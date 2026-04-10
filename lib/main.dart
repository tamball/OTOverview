import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "screens/main_shell.dart";
import "settings/app_text_scale.dart";
import "theme/app_theme.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
  );
  runApp(const BibleOverviewApp());
}

class BibleOverviewApp extends StatefulWidget {
  const BibleOverviewApp({super.key});

  @override
  State<BibleOverviewApp> createState() => _BibleOverviewAppState();
}

class _BibleOverviewAppState extends State<BibleOverviewApp> {
  @override
  void initState() {
    super.initState();
    AppTextScale.instance.addListener(_onTextScale);
    AppTextScale.instance.load();
  }

  @override
  void dispose() {
    AppTextScale.instance.removeListener(_onTextScale);
    super.dispose();
  }

  void _onTextScale() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "舊約概覽",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      builder: (context, child) {
        final media = MediaQuery.of(context);
        return MediaQuery(
          data: media.copyWith(
            textScaler: TextScaler.linear(AppTextScale.instance.scale),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: const MainShell(),
    );
  }
}
