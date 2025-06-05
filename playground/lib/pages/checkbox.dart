import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum CheckTileStyle {
  active,
  inactive,
  indeterminate,
  disabled,
  error,
  withDescription,
  interactive,
}

class CheckTilePage extends StatefulWidget {
  const CheckTilePage({super.key, required this.style});

  final CheckTileStyle style;

  @override
  State<CheckTilePage> createState() => _CheckTilePageState();
}

class _CheckTilePageState extends State<CheckTilePage> {
  bool checkedState = false;
  bool indeterminateState = false;
  bool indeterminateActive = true;
  bool option1 = false;
  bool option2 = false;
  bool option3 = false;
  bool option4 = true;

  void _updateParentState() {
    final selectedCount = [option1, option2, option3].where((e) => e).length;
    if (selectedCount == 0) {
      checkedState = false;
      indeterminateState = false;
    } else if (selectedCount == 3) {
      checkedState = true;
      indeterminateState = false;
    } else {
      checkedState = false;
      indeterminateState = true;
    }
    setState(() {});
  }

  void _updateAllChildren(bool? value) {
    if (value == null) return;
    setState(() {
      option1 = option2 = option3 = value;
      _updateParentState();
    });
  }

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
                CheckTileStyle.active => CheckTile(
                    value: option4,
                    onChanged: (val) => setState(() => option4 = val ?? false),
                  ),
                CheckTileStyle.inactive => CheckTile(
                    value: option1,
                    onChanged: (val) => setState(() => option1 = val ?? false),
                  ),
                CheckTileStyle.indeterminate => CheckTile(
                    value: option4,
                    indeterminate: indeterminateActive,
                    onChanged: (val) => setState(() {
                      option4 = val ?? false;
                      indeterminateActive = false;
                    }),
                  ),
                CheckTileStyle.disabled => const CheckTile(
                    value: false,
                    readOnly: true,
                  ),
                CheckTileStyle.error => CheckTile(
                    value: option1,
                    isError: true,
                    onChanged: (val) => setState(() => option1 = val ?? false),
                  ),
                CheckTileStyle.withDescription => CheckTile(
                    value: option1,
                    label: 'Checkbox with Description',
                    description: 'This is a description for the checkbox.',
                    onChanged: (val) => setState(() => option1 = val ?? false),
                  ),
                CheckTileStyle.interactive => Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Parent checkbox with indeterminate state
                      CheckTile(
                        value: checkedState,
                        indeterminate: indeterminateState,
                        onChanged: _updateAllChildren,
                        label: 'Select All',
                      ),

                      // Child checkboxes
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (
                              value: option1,
                              label: 'Option 1',
                              onChanged: (bool? val) => option1 = val ?? false
                            ),
                            (
                              value: option2,
                              label: 'Option 2',
                              onChanged: (bool? val) => option2 = val ?? false,
                            ),
                            (
                              value: option3,
                              label: 'Option 3',
                              onChanged: (bool? val) => option3 = val ?? false,
                            ),
                          ].map((e) {
                            return CheckTile(
                              value: e.value,
                              label: e.label,
                              onChanged: (bool? value) {
                                e.onChanged.call(value ?? false);
                                _updateParentState();
                              },
                            );
                          }).toList(),
                        ),
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
