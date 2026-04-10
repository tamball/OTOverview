import "package:flutter/material.dart";

/// 柔和藍綠 + 暖橘輔色，Material 3。
abstract final class AppTheme {
  /// 舊約落地頁專用：紫靛主色、赭石輔色、暖紙感背景（與 [light] 區隔）。
  static ColorScheme get landingColorScheme {
    final base = ColorScheme.fromSeed(
      seedColor: const Color(0xFF5E4B8A),
      brightness: Brightness.light,
    );
    return base.copyWith(
      primary: const Color(0xFF342852),
      onPrimary: const Color(0xFFFFF8F0),
      primaryContainer: const Color(0xFFD4C8E8),
      onPrimaryContainer: const Color(0xFF1E1433),
      secondary: const Color(0xFFB07D4A),
      onSecondary: Colors.white,
      secondaryContainer: const Color(0xFFF2DCC4),
      onSecondaryContainer: const Color(0xFF3D2914),
      tertiary: const Color(0xFF4A6670),
      onTertiary: Colors.white,
      tertiaryContainer: const Color(0xFFC8D8DE),
      onTertiaryContainer: const Color(0xFF1A2C32),
      surface: const Color(0xFFF7F3EC),
      onSurface: const Color(0xFF1C1B18),
      onSurfaceVariant: const Color(0xFF4D4740),
      surfaceContainerLowest: const Color(0xFFFFFFFF),
      surfaceContainerLow: const Color(0xFFF0EAE2),
      surfaceContainer: const Color(0xFFEAE3D9),
      surfaceContainerHigh: const Color(0xFFE4DDD1),
      surfaceContainerHighest: const Color(0xFFDED6C9),
      outline: const Color(0xFF7D756C),
      outlineVariant: const Color(0xFFCFC6BA),
    );
  }

  static ThemeData landingThemeOverlay(ThemeData parent) {
    final s = landingColorScheme;
    final titleLarge = parent.textTheme.titleLarge;
    return parent.copyWith(
      colorScheme: s,
      cardTheme: parent.cardTheme.copyWith(color: s.surfaceContainerLow),
      textTheme: parent.textTheme.copyWith(
        titleLarge: titleLarge?.copyWith(
          fontSize: 30,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.3,
          height: 1.12,
          color: s.primary,
        ),
      ),
      appBarTheme: parent.appBarTheme.copyWith(
        backgroundColor: s.surface,
        foregroundColor: s.onSurface,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: parent.appBarTheme.titleTextStyle?.copyWith(
          color: s.primary,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  static ThemeData get light {
    const seed = Color(0xFF1B7F7A);
    final base = ColorScheme.fromSeed(
      seedColor: seed,
      brightness: Brightness.light,
      primary: const Color(0xFF0F4C5C),
      secondary: const Color(0xFFE76F51),
      tertiary: const Color(0xFF2A9D8F),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: base,
      textTheme: Typography.material2021(platform: TargetPlatform.iOS)
          .black
          .apply(
            bodyColor: const Color(0xFF1A1A1A),
            displayColor: const Color(0xFF0F172A),
          )
          .copyWith(
            bodyLarge: const TextStyle(fontSize: 17, height: 1.45),
            bodyMedium: const TextStyle(fontSize: 16, height: 1.45),
            titleLarge: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.2,
            ),
          ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        backgroundColor: base.surface,
        foregroundColor: base.onSurface,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: base.primary,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: base.surfaceContainerLow,
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: BorderSide(color: base.outlineVariant),
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: base.primary,
        unselectedLabelColor:
            Color.lerp(base.onSurface, base.onSurfaceVariant, 0.35)!,
        indicatorColor: base.primary,
        dividerColor: base.outlineVariant,
        indicatorSize: TabBarIndicatorSize.label,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: base.secondary,
        foregroundColor: Colors.white,
        extendedTextStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 72,
        elevation: 3,
        shadowColor: Colors.black38,
        backgroundColor: base.surfaceContainerHigh,
        indicatorColor: base.secondary.withValues(alpha: 0.42),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return TextStyle(
            fontSize: 12,
            fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
            letterSpacing: 0.2,
            color: selected ? base.primary : base.onSurfaceVariant,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected
                ? base.primary
                : base.onSurface.withValues(alpha: 0.48),
            size: selected ? 28 : 24,
          );
        }),
      ),
    );
  }
}
