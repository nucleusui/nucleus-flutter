import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum QuickTipStyle {
  up,
  down,
  left,
  right,
  noTail,
  customContent,
}

class QuickTipPage extends StatelessWidget {
  const QuickTipPage({super.key, required this.style});

  final QuickTipStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: switch (style) {
            QuickTipStyle.up => const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  QuickTip(
                    message: 'Hello world!',
                    child: Icon(Icons.info_outline),
                  ),
                  SizedBox(width: 8),
                  Text('Hover or focus icon to see the tooltip'),
                ],
              ),
            QuickTipStyle.down => const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  QuickTip(
                    message: 'Hello world!',
                    direction: AxisDirection.down,
                    child: Icon(Icons.info_outline),
                  ),
                  SizedBox(width: 8),
                  Text('Hover or focus icon to see the tooltip'),
                ],
              ),
            QuickTipStyle.left => const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  QuickTip(
                    message: 'Hello world!',
                    direction: AxisDirection.left,
                    child: Icon(Icons.info_outline),
                  ),
                  SizedBox(width: 8),
                  Text('Hover or focus icon to see the tooltip'),
                ],
              ),
            QuickTipStyle.right => const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  QuickTip(
                    message: 'Hello world!',
                    direction: AxisDirection.right,
                    child: Icon(Icons.info_outline),
                  ),
                  SizedBox(width: 8),
                  Text('Hover or focus icon to see the tooltip'),
                ],
              ),
            QuickTipStyle.noTail => const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  QuickTip(
                    message: 'Hello world!',
                    tailLength: 0,
                    child: Icon(Icons.info_outline),
                  ),
                  SizedBox(width: 8),
                  Text('Hover or focus icon to see the tooltip'),
                ],
              ),
            QuickTipStyle.customContent => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  QuickTip(
                    content: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        spacing: 5,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const FlutterLogo(),
                          Text(
                            'Custom Content',
                            style: AppFonts.regular14.copyWith(
                              color: context.color.fgBaseReverse,
                            ),
                          ),
                        ],
                      ),
                    ),
                    child: const Icon(Icons.info_outline),
                  ),
                  const SizedBox(width: 8),
                  const Text('Hover or focus icon to see the tooltip'),
                ],
              ),
          },
        ),
      ),
    );
  }
}
