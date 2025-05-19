import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';
import 'package:nucleus_ui/src/button.dart';

/// Shows a customizable modal dialog using the design system styling.
///
/// This is a convenience wrapper around [showDialog] that creates a [KitDialog].
/// The dialog supports hero images, titles, content, and customizable actions.
///
/// Example usage:
/// ```dart
/// showKitDialog(
///   context,
///   title: 'Delete Item',
///   subtitle: 'Are you sure you want to delete this item?',
///   primaryLabel: 'Delete',
///   onPrimary: () => handleDelete(),
///   secondaryLabel: 'Cancel',
///   onSecondary: () => Navigator.pop(context),
/// );
/// ```
Future<T?> showKitDialog<T>(
  BuildContext context, {
  Widget? heroImage,
  String? title,
  String? subtitle,
  Widget? content,
  String? primaryLabel,
  VoidCallback? onPrimary,
  String? secondaryLabel,
  VoidCallback? onSecondary,
  double radius = 12,
  bool barrierDismissible = true,
  bool isFull = false,
  EdgeInsetsGeometry padding = const EdgeInsets.all(24),
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (_) => KitDialog(
      heroImage: heroImage,
      title: title,
      subtitle: subtitle,
      content: content,
      primaryLabel: primaryLabel,
      onPrimary: onPrimary,
      secondaryLabel: secondaryLabel,
      onSecondary: onSecondary,
      radius: radius,
      isFull: isFull,
      padding: padding,
    ),
  );
}

/// A customizable modal dialog component based on the design system.
///
/// The dialog provides a flexible layout for:
/// - Title and subtitle text
/// - Optional hero image banner
/// - Custom content area
/// - Primary and secondary action buttons
/// - Scrollable content when needed
///
/// The dialog's appearance and behavior can be customized through properties
/// like [radius], [padding], and [isFull]. Content is arranged in a vertical
/// layout with consistent spacing and styling.
///
/// See also:
///  * [showKitDialog], which provides a convenient way to display this dialog
///  * [Button], which is used for the dialog's action buttons
///
/// Example usage:
/// ```dart
/// KitDialog(
///   title: 'Success',
///   subtitle: 'Your changes have been saved',
///   heroImage: Image.asset('assets/success.png'),
///   primaryLabel: 'Continue',
///   onPrimary: () => handleContinue(),
/// )
/// ```
class KitDialog extends StatelessWidget {
  const KitDialog({
    super.key,
    this.heroImage,
    this.title,
    this.subtitle,
    this.content,
    this.primaryLabel,
    this.onPrimary,
    this.secondaryLabel,
    this.onSecondary,
    this.radius = 12,
    required this.isFull,
    this.padding = const EdgeInsets.all(16),
  });

  /// Optional widget displayed as a full-width banner at the top of the dialog.
  /// Commonly used for images, icons, or visual indicators.
  final Widget? heroImage;

  /// The primary text displayed at the top of the dialog content.
  /// Usually a short, descriptive header.
  final String? title;

  /// Secondary text displayed below the title.
  /// Provides additional context or details.
  final String? subtitle;

  /// Custom widget displayed in the dialog's content area.
  /// Can be any widget - text fields, lists, custom layouts, etc.
  final Widget? content;

  /// Text label for the primary action button.
  /// When null, no primary button is shown.
  final String? primaryLabel;

  /// Callback triggered when the primary button is pressed.
  /// Button appears disabled if null.
  final VoidCallback? onPrimary;

  /// Text label for the optional secondary action button.
  /// When null, no secondary button is shown.
  final String? secondaryLabel;

  /// Callback triggered when the secondary button is pressed.
  /// Secondary button is only shown when both label and callback are provided.
  final VoidCallback? onSecondary;

  /// Corner radius of the dialog container and hero image if present.
  /// Default is 12.
  final double radius;

  /// When true, content expands to fill dialog width and uses different padding.
  /// Useful for wider content like forms or lists.
  final bool isFull;

  /// Padding around the dialog content.
  /// Default is 16 pixels on all sides.
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    // Build the dialog contents
    final children = <Widget>[];

    if (heroImage != null) {
      children.addAll([
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
          child: heroImage,
        ),
        const SizedBox(height: 24),
      ]);
    }

    children.addAll([
      Padding(
        padding:
            isFull ? const EdgeInsets.fromLTRB(16, 0, 16, 8) : EdgeInsets.zero,
        child: Column(
          children: [
            if (title != null)
              Text(
                title!,
                textAlign: TextAlign.center,
                style: AppFonts.bold24,
              ),
            if (subtitle != null) ...[
              const SizedBox(height: 4),
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: AppFonts.regular16.copyWith(
                  color: context.color.fgMuted,
                ),
              ),
            ],
            if (content != null) ...[
              content!,
            ],
            if (primaryLabel != null && primaryLabel != null) ...[
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: Button.primary(
                  onPressed: onPrimary,
                  label: primaryLabel,
                  labelStyle: AppFonts.semiBold16,
                ),
              )
            ],
            if (secondaryLabel != null && onSecondary != null) ...[
              const SizedBox(height: 12),
              Button.ghost(
                onPressed: onSecondary,
                label: secondaryLabel,
              ),
            ]
          ],
        ),
      ),
    ]);

    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: SingleChildScrollView(
        padding: isFull ? const EdgeInsets.only(bottom: 16) : padding,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: context.screenHeight - context.viewInsetsOf.bottom - 32,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),
        ),
      ),
    );
  }
}
