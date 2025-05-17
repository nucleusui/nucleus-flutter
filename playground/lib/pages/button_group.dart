import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum ButtonGroupStyle {
  noIcon,
  hasIcon,
}

class ButtonGroupPage extends StatelessWidget {
  const ButtonGroupPage({super.key, required this.style});

  final ButtonGroupStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500, maxHeight: 200),
          child: switch (style) {
            ButtonGroupStyle.noIcon => ButtonGroup(
                onOptionSelected: (index) {
                  debugPrint('Selected index: $index');
                },
                options: const [
                  ButtonGroupOption(label: 'Option 1'),
                  ButtonGroupOption(label: 'Option 2'),
                  ButtonGroupOption(label: 'Option 3'),
                ],
              ),
            ButtonGroupStyle.hasIcon => ButtonGroup(
                onOptionSelected: (index) {
                  debugPrint('Selected index: $index');
                },
                options: [
                  ButtonGroupOption(
                    label: 'Option 1',
                    icon: SvgPicture.asset('assets/cube.svg', width: 16),
                  ),
                  ButtonGroupOption(
                    label: 'Option 2',
                    icon: SvgPicture.asset('assets/cube.svg', width: 16),
                  ),
                  ButtonGroupOption(
                    label: 'Option 3',
                    icon: SvgPicture.asset('assets/cube.svg', width: 16),
                  ),
                ],
              ),
          },
        ),
      ),
    );
  }
}
