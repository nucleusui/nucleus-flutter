import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';

/// A customizable segmented control widget for selecting between multiple options.
///
/// The `SegmentedControl` widget creates a horizontal row of selectable segments
/// with different layout types. It supports customizable appearance and selection
/// handling.
///
/// Example usage:
/// ```dart
/// SegmentedControl<String>(
///   type: SegmentedControlType.segments3,
///   segments: ['Option 1', 'Option 2', 'Option 3'],
///   selectedIndex: 0,
///   onSelectionChanged: (index) => print('Selected: $index'),
/// )
/// ```
class SegmentedControl<String> extends StatelessWidget {
  /// Creates a `SegmentedControl` widget.
  ///
  /// The [type] parameter determines the number of segments to display.
  /// The [segments] parameter contains the data for each segment.
  /// The [selectedIndex] parameter indicates which segment is currently selected.
  const SegmentedControl({
    super.key,
    required this.segments,
    required this.selectedIndex,
    this.onSelectionChanged,
    this.height = 32,
    this.borderRadius,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedTextColor,
    this.selectedTextColor,
    this.padding = const EdgeInsets.all(4),
    this.segmentPadding,
  });

  /// The list of segment data.
  final List<String> segments;

  /// The index of the currently selected segment.
  final int selectedIndex;

  /// Callback function called when selection changes.
  final ValueChanged<int>? onSelectionChanged;

  /// The height of the segmented control.
  ///
  /// Defaults to 44.0.
  final double height;

  /// The border radius to apply to the control.
  ///
  /// If null, defaults to circular radius of 8.0.
  final BorderRadiusGeometry? borderRadius;

  /// The background color of the control.
  ///
  /// If null, uses theme-appropriate default colors.
  final Color? backgroundColor;

  /// The color of the selected segment.
  ///
  /// If null, uses theme-appropriate default colors.
  final Color? selectedColor;

  /// The text color for unselected segments.
  ///
  /// If null, uses theme-appropriate default colors.
  final Color? unselectedTextColor;

  /// The text color for the selected segment.
  ///
  /// If null, uses theme-appropriate default colors.
  final Color? selectedTextColor;

  /// The padding around the entire control.
  ///
  final EdgeInsetsGeometry padding;

  /// The padding inside each segment.
  ///
  final EdgeInsetsGeometry? segmentPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? context.color.baseColor,
        borderRadius: borderRadius ?? BorderRadius.circular(999),
      ),
      child: Row(
        children: segments.asMap().entries.map((e) {
          final isSelected = e.key == selectedIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => onSelectionChanged?.call(e.key),
              child: Container(
                padding: segmentPadding,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? (selectedColor ?? context.color.chipColor)
                      : Colors.transparent,
                  borderRadius: borderRadius ?? BorderRadius.circular(999),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .1),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ]
                      : null,
                ),
                child: Text(
                  e.value.toString(),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppFonts.bold12.copyWith(
                    color: isSelected
                        ? selectedTextColor ?? context.color.chipFgColor
                        : unselectedTextColor ?? context.color.grey50,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
