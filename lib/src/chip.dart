import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';
import 'package:nucleus_ui/src/avatar.dart';

/// A custom chip component based on the design system.
///
/// Chips are compact elements that represent:
/// - Input values
/// - Choices within a set of options
/// - Filters for content
/// - Actions that can be triggered
///
/// The chip's appearance can be customized through [ChipType] and [ChipState].
/// Visual elements like icons and avatars can be added, and the chip can expand
/// to full width.
///
/// Example usage:
/// ```dart
/// CustomChip(
///   label: 'Filter',
///   type: ChipType.filled,
///   onPressed: () => print('Chip pressed'),
/// )
/// ```
class CustomChip extends StatelessWidget {
  /// Creates a custom chip component.
  ///
  /// The [label] parameter defines the text shown in the chip.
  /// [prefixIcon] and [suffixIcon] can be used to add icons before/after the label.
  /// [avatar] displays a small circular image at the start of the chip.
  /// [type] controls the visual style like filled or outlined.
  /// [state] affects interaction and appearance states like hover, disabled etc.
  /// [isActive] indicates if the chip is selected/active.
  /// [fullWidth] makes the chip expand to fill container width.
  /// [onPressed] is called when the chip is tapped.
  const CustomChip({
    super.key,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.avatar,
    this.type = ChipType.filled,
    this.state = ChipState.enabled,
    this.isActive = false,
    this.fullWidth = false,
    this.onPressed,
  });

  /// The text displayed in the chip.
  final String label;

  /// An optional widget displayed before the label.
  /// Usually an icon providing visual context.
  final Widget? prefixIcon;

  /// An optional widget displayed after the label.
  /// Usually an icon for actions like clear/remove.
  final Widget? suffixIcon;

  /// URL for an optional avatar image shown at the start of the chip.
  /// When provided, creates a small circular image.
  final String? avatar;

  /// Visual style variant of the chip.
  /// Affects background, border and interactions.
  /// See [ChipType] for available options.
  final ChipType type;

  /// Current interaction/visual state of the chip.
  /// Controls hover, focus, error and disabled states.
  /// See [ChipState] for all available states.
  final ChipState state;

  /// Whether the chip is in selected/active state.
  /// Changes background and text colors when true.
  final bool isActive;

  /// When true, expands chip to fill container width.
  /// Centers content within the expanded width.
  final bool fullWidth;

  /// Callback triggered when chip is tapped.
  /// Chip appears disabled when null.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final hasAvatar = avatar != null;
    final hasPrefixIcon = prefixIcon != null;
    final hasSuffixIcon = suffixIcon != null;
    final borderColor =
        isActive ? context.color.primary : context.color.borderSubtle;
    final textColor = _textColor(context);
    final backgroundColor = _backgroundColor(context);
    final textStyle = AppFonts.semiBold16.copyWith(color: textColor);

    final chipContent = Row(
      spacing: 8,
      mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment:
          fullWidth ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        if (hasAvatar) Avatar(image: avatar!, size: AvatarSize.xs),
        if (hasPrefixIcon && !hasAvatar) prefixIcon!,
        Text(label, style: textStyle),
        if (hasSuffixIcon) suffixIcon!,
      ],
    );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      constraints: fullWidth
          ? const BoxConstraints(minWidth: double.infinity)
          : const BoxConstraints(),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: type == ChipType.filled ? Colors.transparent : borderColor,
        ),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(32),
          child: Padding(
            padding: hasAvatar
                ? const EdgeInsets.fromLTRB(4, 4, 12, 4)
                : const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: chipContent,
          ),
        ),
      ),
    );
  }

  Color _textColor(BuildContext context) {
    switch (state) {
      case ChipState.disabled:
        return context.color.grey50;
      case ChipState.error:
        return Colors.red;
      default:
        return isActive ? Colors.white : context.color.accentBold;
    }
  }

  Color _backgroundColor(BuildContext context) {
    switch (state) {
      case ChipState.disabled:
        return context.color.bgDisabled;
      case ChipState.error:
        return context.color.red10;
      case ChipState.hover:
        return context.color.accentMuted;
      case ChipState.focus:
        return context.color.accentDim;
      case ChipState.pressed:
        return context.color.primary;
      default:
        return type == ChipType.filled || isActive
            ? (isActive
                ? context.color.accentModerate
                : context.color.accentSubtle)
            : Colors.transparent;
    }
  }
}

/// Defines the visual style variants available for chips.
///
/// - [filled] has a solid background color
/// - [outline] has only a border with transparent background
/// - [filledWithAvatar] similar to filled but optimized for avatar display
/// - [filledOutline] combines filled background with visible border
/// - [fullwidth] expands to fill width with filled style
/// - [outlineFullwidth] expands to fill width with outline style
enum ChipType {
  filled,
  outline,
  filledWithAvatar,
  filledOutline,
  fullwidth,
  outlineFullwidth,
}

/// Defines the interaction and visual states of a chip.
///
/// These states affect the chip's appearance and behavior:
/// - [enabled] is the default interactive state
/// - [hover] when the pointer is over the chip
/// - [focus] when the chip has keyboard focus
/// - [pressed] during tap/click interactions
/// - [error] indicates invalid or error state
/// - [disabled] makes the chip non-interactive
/// - [skeleton] placeholder state while loading
enum ChipState { enabled, hover, focus, pressed, error, disabled }
