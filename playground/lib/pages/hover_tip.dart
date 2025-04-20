import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum HoverTipStyle {
  up,
  down,
  left,
  right,
  noTail,
  customContent,
}

class HoverTipPage extends StatelessWidget {
  const HoverTipPage({super.key, required this.style});

  final HoverTipStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: switch (style) {
            HoverTipStyle.up => const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HoverTip(
                    message: 'Hello world!',
                    child: Icon(Icons.info_outline),
                  ),
                  SizedBox(width: 8),
                  Text('Hover or focus icon to see the tooltip'),
                ],
              ),
            HoverTipStyle.down => const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HoverTip(
                    message: 'Hello world!',
                    direction: AxisDirection.down,
                    child: Icon(Icons.info_outline),
                  ),
                  SizedBox(width: 8),
                  Text('Hover or focus icon to see the tooltip'),
                ],
              ),
            HoverTipStyle.left => const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HoverTip(
                    message: 'Hello world!',
                    direction: AxisDirection.left,
                    child: Icon(Icons.info_outline),
                  ),
                  SizedBox(width: 8),
                  Text('Hover or focus icon to see the tooltip'),
                ],
              ),
            HoverTipStyle.right => const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HoverTip(
                    message: 'Hello world!',
                    direction: AxisDirection.right,
                    child: Icon(Icons.info_outline),
                  ),
                  SizedBox(width: 8),
                  Text('Hover or focus icon to see the tooltip'),
                ],
              ),
            HoverTipStyle.noTail => const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HoverTip(
                    message: 'Hello world!',
                    tailLength: 0,
                    child: Icon(Icons.info_outline),
                  ),
                  SizedBox(width: 8),
                  Text('Hover or focus icon to see the tooltip'),
                ],
              ),
            HoverTipStyle.customContent => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HoverTip(
                    content: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        spacing: 5,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const FlutterLogo(),
                          Text(
                            'Custom Content',
                            style: AppFonts.bodySm.copyWith(
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
