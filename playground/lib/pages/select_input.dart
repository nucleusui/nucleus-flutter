import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum SelectInputStyle {
  standard,
  floatingLabel,
}

class SelectInputPage extends StatelessWidget {
  const SelectInputPage({super.key, required this.style});

  final SelectInputStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 500),
          child: switch (style) {
            SelectInputStyle.standard => SelectInput<int>(
                label: 'Select an option',
                dropdownMenuEntries: List.generate(3, (e) {
                  return DropdownMenuEntry<int>(
                    value: e,
                    label: 'Option $e',
                  );
                }),
              ),
            SelectInputStyle.floatingLabel => SelectInput<int>(
                label: 'Select an option',
                selectedLabel: 'Your selection',
                showLabel: true,
                dropdownMenuEntries: List.generate(3, (e) {
                  return DropdownMenuEntry<int>(
                    value: e,
                    label: 'Option $e',
                  );
                }),
              ),
          },
        ),
      ),
    );
  }
}
