import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum InputFieldStyle {
  standard,
  floatingLabel,
  prefixIcon,
  suffixIcon,
  bothIcon,
  disabled,
}

class InputFieldPage extends StatelessWidget {
  const InputFieldPage({super.key, required this.style});

  final InputFieldStyle style;

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
                InputFieldStyle.standard => InputField(
                    hintText: 'Placeholder text',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                InputFieldStyle.floatingLabel => const InputField(
                    labelText: 'Text Label',
                    hintText: 'Text you just entered',
                  ),
                InputFieldStyle.prefixIcon => InputField(
                    hintText: 'Search location',
                    prefixIcon: SvgPicture.asset('assets/location.svg'),
                  ),
                InputFieldStyle.suffixIcon => InputField(
                    labelText: 'Text Label',
                    hintText: 'Text you just entered',
                    suffixIcon: SvgPicture.asset(
                      'assets/circle.svg',
                      width: 20,
                    ),
                  ),
                InputFieldStyle.bothIcon => InputField(
                    labelText: 'Location',
                    hintText: 'Location of your choose',
                    prefixIcon: SvgPicture.asset('assets/location.svg'),
                    suffixIcon: SvgPicture.asset(
                      'assets/circle.svg',
                      width: 20,
                    ),
                  ),
                InputFieldStyle.disabled => const InputField(
                    enabled: false,
                    hintText: 'Placeholder text',
                  ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
