import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum RadioStyle {
  active,
  inactive,
  error,
  withDescription,
  interactive,
}

enum RadioOption { option1, option2 }

class RadioPage extends StatefulWidget {
  const RadioPage({super.key, required this.style});

  final RadioStyle style;

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  RadioOption? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              switch (widget.style) {
                RadioStyle.active => const RadioButton<bool>(value: true),
                RadioStyle.inactive => const RadioButton<bool>(value: false),
                RadioStyle.error =>
                  const RadioButton<bool>(value: true, isError: true),
                RadioStyle.withDescription => const RadioButton<bool>(
                    value: true, label: 'Title', description: 'Caption'),
                RadioStyle.interactive => Row(
                    spacing: 24,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RadioButton<RadioOption>(
                        value: RadioOption.option1,
                        label: 'Option 1',
                        groupValue: selectedOption,
                        onChanged: (val) =>
                            setState(() => selectedOption = val),
                      ),
                      RadioButton<RadioOption>(
                        value: RadioOption.option2,
                        label: 'Option 2',
                        groupValue: selectedOption,
                        onChanged: (val) =>
                            setState(() => selectedOption = val),
                      ),
                    ],
                  ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
