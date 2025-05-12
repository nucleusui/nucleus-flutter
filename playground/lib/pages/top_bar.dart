import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum TopBarStyle {
  center,
  left,
  large,
  withAction,
}

class TopBarPage extends StatelessWidget {
  const TopBarPage({super.key, required this.style});

  final TopBarStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500, maxHeight: 200),
          child: switch (style) {
            TopBarStyle.center => const TopBar(
                title: 'Title',
              ),
            TopBarStyle.left => const TopBar(
                title: 'Title',
                type: TopBarType.leftTitle,
              ),
            TopBarStyle.large => const TopBar(
                title: 'Large Title',
                subtitle: 'Subtitle',
                type: TopBarType.largeTitle,
              ),
            TopBarStyle.withAction => const TopBar(
                title: 'Large Title',
                subtitle: 'Subtitle',
                type: TopBarType.largeTitle,
                actions: [
                  Icon(Icons.search),
                  SizedBox(width: 8),
                  Icon(Icons.notifications),
                ],
              ),
          },
        ),
      ),
    );
  }
}
