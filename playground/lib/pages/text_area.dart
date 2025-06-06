import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum TextAreaStyle {
  basic,
  disabled,
  withValidator,
}

class TextAreaPage extends StatelessWidget {
  const TextAreaPage({super.key, required this.style});

  final TextAreaStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 16),
          constraints: const BoxConstraints(maxWidth: 500, maxHeight: 200),
          child: switch (style) {
            TextAreaStyle.basic => const InputField(
                minLines: 3,
                maxLines: 6,
                hintText: 'Write a note',
                textInputType: TextInputType.multiline,
              ),
            TextAreaStyle.disabled => const InputField(
                minLines: 3,
                maxLines: 6,
                hintText: 'Write a note',
                textInputType: TextInputType.multiline,
                enabled: false,
              ),
            TextAreaStyle.withValidator => InputField(
                minLines: 3,
                maxLines: 6,
                hintText: 'Press enter to validate',
                textInputType: TextInputType.multiline,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Note cannot be empty';
                  }
                  return null;
                },
              ),
          },
        ),
      ),
    );
  }
}
