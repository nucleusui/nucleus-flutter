import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/extension/context.dart';

/// A customizable toggle switch widget for boolean inputs.
///
/// The `Toggle` widget provides a switch-style input for boolean values.
/// It supports different states including active, inactive, and read-only.
/// The widget uses Cupertino-style switch design with customizable colors and sizing.
///
/// Example usage:
/// ```dart
/// Toggle(
///   value: isEnabled,
///   onChanged: (value) {
///     setState(() {
///       isEnabled = value;
///     });
///   },
/// )
/// ```
class Toggle extends StatelessWidget {
  /// Creates a `Toggle` widget.
  ///
  /// The [value] parameter is required and represents the current state of the toggle.
  /// Use [onChanged] to handle state changes when the toggle is tapped.
  /// Set [readOnly] to true to disable user interaction.
  const Toggle({
    super.key,
    required this.value,
    this.readOnly = false,
    this.onChanged,
    this.size = 10,
    this.thumbColor = Colors.white,
    this.activeTrackColor,
    this.inactiveTrackColor,
  });

  /// Called when the toggle state changes.
  ///
  /// If null, the toggle will be considered disabled and won't respond to input.
  /// When [readOnly] is true, this callback is ignored.
  final void Function(bool)? onChanged;

  /// The current value of the toggle.
  ///
  /// `true` means the toggle is in the active/on state,
  /// `false` means the toggle is in the inactive/off state.
  /// This parameter is required.
  final bool value;

  /// Whether the toggle is read-only.
  ///
  /// When `true`, the toggle cannot be interacted with and appears disabled.
  /// The [onChanged] callback will be ignored. Defaults to `false`.
  final bool readOnly;

  /// The size factor for the toggle.
  ///
  /// This value is used to scale the toggle from its base size of 15.
  /// Larger values make the toggle bigger, smaller values make it smaller.
  /// Defaults to `10`.
  final double size;

  /// The color of the toggle thumb (the circular part that moves).
  ///
  /// When [readOnly] is true, this is overridden with disabled color.
  /// Defaults to `Colors.white`.
  final Color? thumbColor;

  /// The color of the track when the toggle is active/on.
  ///
  /// If not provided, uses the theme's accent moderate color.
  /// When [readOnly] is true, this is overridden with disabled color.
  final Color? activeTrackColor;

  /// The color of the track when the toggle is inactive/off.
  ///
  /// If not provided, uses the default Cupertino switch inactive color.
  final Color? inactiveTrackColor;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: size / 15,
      child: CupertinoSwitch(
        value: value,
        onChanged: readOnly ? null : onChanged,
        thumbColor: readOnly ? context.color.fgDisabled : thumbColor,
        activeTrackColor: readOnly
            ? context.color.bgDisabled
            : activeTrackColor ?? context.color.accentModerate,
        inactiveTrackColor: inactiveTrackColor,
      ),
    );
  }
}
