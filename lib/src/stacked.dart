import 'package:flutter/material.dart';

/// A widget that arranges its children in a horizontally stacked layout.
///
/// The [Stacked] widget places its children in a horizontal stack, with each child
/// overlapping the previous one by a specified amount. The stacking direction can
/// be controlled using the [direction] parameter.
///
/// Parameters:
/// * [items] - The list of widgets to be stacked.
/// * [direction] - The text direction that determines the stacking order.
///   Defaults to [TextDirection.rtl].
/// * [size] - The width and height of each item container. Defaults to 100.
/// * [xShift] - The horizontal overlap between items. Defaults to 20.
class Stacked extends StatelessWidget {
  const Stacked({
    super.key,
    required this.items,
    this.direction = TextDirection.rtl,
    this.size = 100,
    this.xShift = 20,
  });

  final List<Widget> items;
  final TextDirection direction;
  final double size;
  final double xShift;

  @override
  Widget build(BuildContext context) {
    final allItems = items
        .asMap()
        .map((index, item) {
          final left = size - xShift;

          final value = Container(
            width: size,
            height: size,
            margin: EdgeInsets.only(left: left * index),
            child: item,
          );

          return MapEntry(index, value);
        })
        .values
        .toList();

    return Stack(
      children: direction == TextDirection.rtl
          ? allItems
          : allItems.reversed.toList(),
    );
  }
}
