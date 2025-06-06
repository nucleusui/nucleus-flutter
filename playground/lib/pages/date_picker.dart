import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum DatePickerStyle {
  basic,
  dialog,
}

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({super.key, required this.style});

  final DatePickerStyle style;

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500, maxHeight: 450),
          child: switch (widget.style) {
            DatePickerStyle.basic => DatePicker(
                currentDay: selectedDay,
                onDaySelected: (p0, p1) => setState(() => selectedDay = p1),
              ),
            DatePickerStyle.dialog => Button.primary(
                onPressed: () => showDialog<void>(
                  context: context,
                  builder: (context) => Dialog(
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(maxWidth: 500, maxHeight: 400),
                      child: DatePicker(
                        onDaySelected: (p0, p1) {
                          setState(() => selectedDay = p1);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
                label: selectedDay == null
                    ? 'Pick a date'
                    : 'Selected: ${selectedDay.toString().split(' ').first}',
              ),
          },
        ),
      ),
    );
  }
}
