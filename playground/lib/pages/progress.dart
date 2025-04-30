import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum ProgressStyle {
  basic,
  labelBottomLeft,
  labelBottomRight,
  labelBottomCenter,
  labelBottomBoth,
  labelTopLeft,
  labelTopRight,
  labelTopCenter,
  labelTopBoth,
  labelCenterLeft,
  labelCenterRight,
  labelCenterBoth,
}

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key, required this.style});

  final ProgressStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              switch (style) {
                ProgressStyle.basic => const Progress(
                    value: 15,
                  ),
                ProgressStyle.labelBottomLeft => const Progress(
                    value: 15,
                    label: '15% to goal',
                  ),
                ProgressStyle.labelBottomRight => const Progress(
                    value: 15,
                    alignment: Alignment.bottomRight,
                    label: '15% to goal',
                  ),
                ProgressStyle.labelBottomCenter => const Progress(
                    value: 15,
                    alignment: Alignment.bottomCenter,
                    label: 'Quota used: 15%',
                  ),
                ProgressStyle.labelBottomBoth => const Progress(
                    value: 15,
                    alignment: Alignment.bottomCenter,
                    label: '15% to goal',
                    secondaryLabel: '7 days left',
                  ),
                ProgressStyle.labelTopLeft => const Progress(
                    value: 15,
                    alignment: Alignment.topLeft,
                    label: '15% to goal',
                  ),
                ProgressStyle.labelTopRight => const Progress(
                    value: 15,
                    alignment: Alignment.topRight,
                    label: '15% to goal',
                  ),
                ProgressStyle.labelTopCenter => const Progress(
                    value: 15,
                    alignment: Alignment.topCenter,
                    label: 'Quota used: 15%',
                  ),
                ProgressStyle.labelTopBoth => const Progress(
                    value: 15,
                    alignment: Alignment.topCenter,
                    label: '15% to goal',
                    secondaryLabel: '7 days left',
                  ),
                ProgressStyle.labelCenterLeft => const Progress(
                    value: 15,
                    alignment: Alignment.centerLeft,
                    label: '15% to goal',
                  ),
                ProgressStyle.labelCenterRight => const Progress(
                    value: 15,
                    alignment: Alignment.centerRight,
                    label: '15% to goal',
                  ),
                ProgressStyle.labelCenterBoth => const Progress(
                    value: 15,
                    alignment: Alignment.center,
                    label: '15% to goal',
                    secondaryLabel: '7 days left',
                  ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
