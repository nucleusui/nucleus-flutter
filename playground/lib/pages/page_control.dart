import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum PageControlStyle {
  dot,
  bar,
  dotOnImage,
  barOnImage,
}

class PageControlPage extends StatefulWidget {
  const PageControlPage({super.key, required this.style});

  final PageControlStyle style;

  @override
  State<PageControlPage> createState() => _PageControlPageState();
}

class _PageControlPageState extends State<PageControlPage> {
  int current = 2;
  final int total = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: switch (widget.style) {
            PageControlStyle.dot => PageControl(
                total: total,
                current: current,
              ),
            PageControlStyle.bar => PageControl.bar(
                total: total,
                current: current,
              ),
            PageControlStyle.dotOnImage => Container(
                width: 400,
                height: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF1a1a2e),
                      Color(0xFF16213e),
                      Color(0xFF0f3460),
                    ],
                  ),
                ),
                child: Center(
                  child: PageControl(
                    total: total,
                    current: current,
                    activeColor: Colors.white,
                    inactiveColor: Colors.white.withValues(alpha: .3),
                  ),
                ),
              ),
            PageControlStyle.barOnImage => Container(
                width: 400,
                height: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF1a1a2e),
                      Color(0xFF16213e),
                      Color(0xFF0f3460),
                    ],
                  ),
                ),
                child: Center(
                  child: PageControl.bar(
                    total: total,
                    current: current,
                    activeColor: Colors.white,
                    inactiveColor: Colors.white.withValues(alpha: .3),
                  ),
                ),
              ),
          },
        ),
      ),
    );
  }
}
