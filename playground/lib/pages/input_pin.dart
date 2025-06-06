import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum InputPinStyle {
  basic,
  disabled,
  error,
}

class InputPinPage extends StatelessWidget {
  const InputPinPage({super.key, required this.style});

  final InputPinStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              switch (style) {
                InputPinStyle.basic => const InputPin(),
                InputPinStyle.disabled => InputPin(
                    enabled: false,
                    autoFocus: false,
                    controller: TextEditingController(text: '12345'),
                  ),
                InputPinStyle.error => InputPin(
                    error: true,
                    autoFocus: false,
                    controller: TextEditingController(text: '12345'),
                  ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
