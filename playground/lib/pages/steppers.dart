import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum SteppersStyle {
  outline,
  roundButton,
  outlineRoundButton,
  minimal,
  disabled,
}

class SteppersPage extends StatefulWidget {
  const SteppersPage({super.key, required this.style});

  final SteppersStyle style;

  @override
  State<SteppersPage> createState() => _SteppersPageState();
}

class _SteppersPageState extends State<SteppersPage> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500, maxHeight: 200),
          child: switch (widget.style) {
            SteppersStyle.outline => Steppers.outline(
                value: _value,
                onAdd: () => setState(() => _value++),
                onRemove: () => setState(() => _value--),
              ),
            SteppersStyle.roundButton => Steppers.roundButton(
                value: _value,
                onAdd: () => setState(() => _value++),
                onRemove: () => setState(() => _value--),
              ),
            SteppersStyle.outlineRoundButton => Steppers.outlineRoundButton(
                value: _value,
                onAdd: () => setState(() => _value++),
                onRemove: () => setState(() => _value--),
              ),
            SteppersStyle.minimal => Column(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Value: $_value'),
                  Steppers.minimal(
                    value: _value,
                    onAdd: () => setState(() => _value++),
                    onRemove: () => setState(() => _value--),
                  ),
                ],
              ),
            SteppersStyle.disabled => Steppers.outline(
                value: _value,
                disabled: true,
                onAdd: () => setState(() => _value++),
                onRemove: () => setState(() => _value--),
              ),
          },
        ),
      ),
    );
  }
}
