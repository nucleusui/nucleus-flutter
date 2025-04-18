import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum PlagroundTextFieldStyle {
  standard,
  floatingLabel,
  leadingIcon,
  trailingIcon,
  bothIcon,
  disabled,
}

class TextFieldPage extends StatelessWidget {
  const TextFieldPage({super.key, required this.style});

  final PlagroundTextFieldStyle style;

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
                PlagroundTextFieldStyle.standard => TextFields(
                    hintText: 'Placeholder text',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                PlagroundTextFieldStyle.floatingLabel => const TextFields(
                    labelText: 'Text Label',
                    hintText: 'Text you just entered',
                  ),
                PlagroundTextFieldStyle.leadingIcon => TextFields(
                    hintText: 'Search location',
                    prefixIcon: SvgPicture.asset('assets/location.svg'),
                  ),
                PlagroundTextFieldStyle.trailingIcon => TextFields(
                    labelText: 'Text Label',
                    hintText: 'Text you just entered',
                    suffixIcon: SvgPicture.asset(
                      'assets/circle.svg',
                      width: 20,
                    ),
                  ),
                PlagroundTextFieldStyle.bothIcon => TextFields(
                    labelText: 'Location',
                    hintText: 'Location of your choose',
                    prefixIcon: SvgPicture.asset('assets/location.svg'),
                    suffixIcon: SvgPicture.asset(
                      'assets/circle.svg',
                      width: 20,
                    ),
                  ),
                PlagroundTextFieldStyle.disabled => const TextFields(
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
