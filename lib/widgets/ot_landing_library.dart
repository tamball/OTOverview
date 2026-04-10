import "dart:math" as math;

import "package:flutter/material.dart";

import "../models/ot_section.dart";

/// 落地頁圖書館風格：牆面、銅牌書架、書脊裝飾。
abstract final class OtLandingLibraryPalette {
  static const Color wallTop = Color(0xFFF4EDE3);
  static const Color wallMid = Color(0xFFE8DFD2);
  static const Color wallBottom = Color(0xFFD9CFC0);

  static List<Color> spinesForSection(String sectionId) {
    return switch (sectionId) {
      "torah" => const [
          Color(0xFF4A3728),
          Color(0xFF5C4033),
          Color(0xFF6B4423),
          Color(0xFF3D2914),
          Color(0xFF5D4E37),
        ],
      "history" => const [
          Color(0xFF6B5344),
          Color(0xFF7D5A4A),
          Color(0xFF5C6B5A),
          Color(0xFF8B6914),
          Color(0xFF6E5C4B),
        ],
      "wisdom" => const [
          Color(0xFF3D5C5C),
          Color(0xFF4A6670),
          Color(0xFF5A7A6E),
          Color(0xFF4D5D4A),
          Color(0xFF556B2F),
        ],
      "prophets" => const [
          Color(0xFF4A3A5C),
          Color(0xFF5C4A6B),
          Color(0xFF6B3D4A),
          Color(0xFF3A4558),
          Color(0xFF5D4E60),
        ],
      _ => const [Color(0xFF5C5346), Color(0xFF4A4540)],
    };
  }
}

/// 落地頁全幅暖色牆紙漸層（可疊在 [ColoredBox] 之上）。
class OtLandingWallpaper extends StatelessWidget {
  const OtLandingWallpaper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            OtLandingLibraryPalette.wallTop,
            OtLandingLibraryPalette.wallMid,
            OtLandingLibraryPalette.wallBottom,
          ],
          stops: [0.0, 0.45, 1.0],
        ),
      ),
      child: CustomPaint(
        painter: _WallPaperLinesPainter(
          color: const Color(0xFF1A140C).withValues(alpha: 0.04),
        ),
        child: child,
      ),
    );
  }
}

class _WallPaperLinesPainter extends CustomPainter {
  _WallPaperLinesPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = color
      ..strokeWidth = 1;
    const step = 28.0;
    for (double x = 0; x < size.width + step; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), p);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 導論影片區：仿皮質／木框展示牌。
class OtLandingIntroPlaque extends StatelessWidget {
  const OtLandingIntroPlaque({
    super.key,
    required this.onTap,
    required this.title,
    required this.subtitle,
  });

  final VoidCallback onTap;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final leather = Color.lerp(scheme.secondary, const Color(0xFF3D2817), 0.35)!;
    final gold = Color.lerp(scheme.secondary, const Color(0xFFE8C547), 0.5)!;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                leather,
                Color.lerp(leather, Colors.black, 0.18)!,
              ],
            ),
            border: Border.all(
              color: gold.withValues(alpha: 0.65),
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 16, 14, 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: scheme.surface.withValues(alpha: 0.92),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.play_circle_fill_rounded,
                    size: 40,
                    color: scheme.primary,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFFFFF8F0),
                              letterSpacing: 0.3,
                            ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: const Color(0xFFFFF8F0).withValues(alpha: 0.88),
                              height: 1.35,
                            ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: gold.withValues(alpha: 0.9),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 單一分部：一層書架 + 書脊 + 銅牌標題。
class OtLibraryShelfSection extends StatelessWidget {
  const OtLibraryShelfSection({
    super.key,
    required this.section,
    required this.onTap,
  });

  final OtSection section;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final palette = OtLandingLibraryPalette.spinesForSection(section.id);

    return Card(
      elevation: 2.5,
      shadowColor: Colors.black.withValues(alpha: 0.18),
      surfaceTintColor: Colors.transparent,
      color: scheme.surfaceContainerLow.withValues(alpha: 0.97),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _BrassNameplate(
                title: section.title,
                detail:
                    "${section.books.length} 卷 · ${section.overviewVideos.length} 支概覽影片",
              ),
              const SizedBox(height: 14),
              LayoutBuilder(
                builder: (context, c) {
                  final n = section.books.length;
                  if (n == 0) return const SizedBox(height: 48);
                  final innerW = c.maxWidth - 20;
                  final spineW = math.max(
                    12.0,
                    math.min(22.0, (innerW - (n - 1) * 2) / n),
                  );
                  return SizedBox(
                    height: 88,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: 14,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (var i = 0; i < n; i++)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 1),
                                  child: _BookSpine(
                                    label: section.books[i].shortName,
                                    width: spineW,
                                    height: 52 + (i * 5 % 14),
                                    baseColor: palette[i % palette.length],
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: _ShelfBoard(),
                        ),
                        const Positioned(
                          left: 4,
                          bottom: 10,
                          child: _ShelfBracket(facingRight: true),
                        ),
                        const Positioned(
                          right: 4,
                          bottom: 10,
                          child: _ShelfBracket(facingRight: false),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Text(
                section.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: scheme.onSurfaceVariant,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Text(
                    "進入分部",
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: scheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Icon(Icons.chevron_right_rounded,
                      size: 20, color: scheme.primary),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BrassNameplate extends StatelessWidget {
  const _BrassNameplate({required this.title, required this.detail});

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFC9A227).withValues(alpha: 0.45),
            const Color(0xFF8B6914).withValues(alpha: 0.35),
          ],
        ),
        border: Border.all(
          color: const Color(0xFF6B5A3E).withValues(alpha: 0.55),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.label_important_rounded,
              size: 22, color: scheme.primary.withValues(alpha: 0.85)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: scheme.onSurface,
                        letterSpacing: 0.2,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  detail,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BookSpine extends StatelessWidget {
  const _BookSpine({
    required this.label,
    required this.width,
    required this.height,
    required this.baseColor,
  });

  final String label;
  final double width;
  final double height;
  final Color baseColor;

  @override
  Widget build(BuildContext context) {
    final hi = Color.lerp(baseColor, Colors.white, 0.12)!;
    final lo = Color.lerp(baseColor, Colors.black, 0.22)!;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(3)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [hi, baseColor, lo],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.22),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 1,
            right: 1,
            top: 6,
            bottom: 10,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
          Center(
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.visible,
                style: TextStyle(
                  fontSize: math.min(11, width + 2),
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withValues(alpha: 0.94),
                  height: 1,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShelfBoard extends StatelessWidget {
  const _ShelfBoard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF6B5344),
            Color(0xFF4A3728),
            Color(0xFF3D2A1F),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x59000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
    );
  }
}

class _ShelfBracket extends StatelessWidget {
  const _ShelfBracket({required this.facingRight});

  final bool facingRight;

  @override
  Widget build(BuildContext context) {
    return Transform.flip(
      flipX: !facingRight,
      child: CustomPaint(
        size: const Size(10, 22),
        painter: _BracketPainter(),
      ),
    );
  }
}

class _BracketPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = const Color(0xFF5A5046).withValues(alpha: 0.75)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height);
    canvas.drawPath(path, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
