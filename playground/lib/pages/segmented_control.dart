import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum SegmentedControlStyle {
  twoSegments,
  threeSegments,
  fourSegments,
  fiveSegments,
}

class SegmentedControlPage extends StatefulWidget {
  const SegmentedControlPage({super.key, required this.style});

  final SegmentedControlStyle style;

  @override
  State<SegmentedControlPage> createState() => _SegmentedControlPageState();
}

class _SegmentedControlPageState extends State<SegmentedControlPage> {
  int selectedIndex = 0;

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
                SegmentedControlStyle.twoSegments => SegmentedControl(
                    segments: const ['Segment', 'Segment'],
                    selectedIndex: selectedIndex,
                    onSelectionChanged: (index) {
                      setState(() => selectedIndex = index);
                    },
                  ),
                SegmentedControlStyle.threeSegments => SegmentedControl(
                    segments: const ['Segment', 'Segment', 'Segment'],
                    selectedIndex: selectedIndex,
                    onSelectionChanged: (index) {
                      setState(() => selectedIndex = index);
                    },
                  ),
                SegmentedControlStyle.fourSegments => SegmentedControl(
                    segments: const [
                      'Segment',
                      'Segment',
                      'Segment',
                      'Segment'
                    ],
                    selectedIndex: selectedIndex,
                    onSelectionChanged: (index) {
                      setState(() => selectedIndex = index);
                    },
                  ),
                SegmentedControlStyle.fiveSegments => SegmentedControl(
                    segments: const [
                      'Segment',
                      'Segment',
                      'Segment',
                      'Segment',
                      'Segment'
                    ],
                    selectedIndex: selectedIndex,
                    onSelectionChanged: (index) {
                      setState(() => selectedIndex = index);
                    },
                  ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
