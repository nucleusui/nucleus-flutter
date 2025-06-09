import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum SliderStyle {
  single,
  range,
}

class SliderPage extends StatefulWidget {
  const SliderPage({super.key, required this.style});

  final SliderStyle style;

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _value = 0;
  RangeValues _dragRangeSlider = const RangeValues(25, 75);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: switch (widget.style) {
            SliderStyle.single => DragSlider(
                value: _value,
                onChanged: (value) => setState(() => _value = value),
              ),
            SliderStyle.range => DragRangeSlider(
                values: _dragRangeSlider,
                onChanged: (value) => setState(() => _dragRangeSlider = value),
              ),
          },
        ),
      ),
    );
  }
}
