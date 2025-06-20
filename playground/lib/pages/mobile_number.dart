import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum MobileNumberStyle {
  standard,
  floatingLabel,
  disabled,
}

class MobileNumberPage extends StatelessWidget {
  const MobileNumberPage({super.key, required this.style});

  final MobileNumberStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 100),
          child: switch (style) {
            MobileNumberStyle.standard => const MobileNumber(
                hintText: 'Mobile number',
              ),
            MobileNumberStyle.floatingLabel => const MobileNumber(
                labelText: 'Mobile number',
              ),
            MobileNumberStyle.disabled => const MobileNumber(
                hintText: 'Mobile number',
                isEnabled: false,
              ),
          },
        ),
      ),
    );
  }
}
