import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum ToggleStyle {
  active,
  inactive,
  disabled,
  large,
}

class TogglePage extends StatefulWidget {
  const TogglePage({super.key, required this.style});

  final ToggleStyle style;

  @override
  State<TogglePage> createState() => _TogglePageState();
}

class _TogglePageState extends State<TogglePage> {
  bool active = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: switch (widget.style) {
            ToggleStyle.active => Toggle(
                value: active,
                onChanged: (value) => setState(() => active = value),
              ),
            ToggleStyle.inactive => Toggle(
                value: !active,
                onChanged: (value) => setState(() => active = !value),
              ),
            ToggleStyle.disabled => Toggle(
                value: active,
                readOnly: true,
                onChanged: (value) => setState(() => active = value),
              ),
            ToggleStyle.large => Toggle(
                value: active,
                size: 15,
                onChanged: (value) => setState(() => active = value),
              ),
          },
        ),
      ),
    );
  }
}
