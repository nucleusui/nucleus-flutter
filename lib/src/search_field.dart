import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/extension/context.dart';
import 'package:nucleus_ui/src/input_field.dart';

/// Type of search field appearance that determines its visual style.
enum SearchFieldType { withContainer, noContainer }

/// A specialized search input component that provides consistent styling and behavior
/// for search functionality across the application.
///
/// The [SearchField] component is built on top of [InputField] and offers additional
/// features specific to search interactions, such as optional back navigation,
/// leading/trailing icons, and container styling variants.
///
/// The component supports two main visual styles through [SearchFieldType]:
/// - [SearchFieldType.withContainer]: Displays the search field with a container background
/// - [SearchFieldType.noContainer]: Shows the search field without a container background
class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.type = SearchFieldType.withContainer,
    this.hintText,
    this.fillColor,
    this.borderRadius,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.controller,
    this.autofocus = false,
    this.height = 48,
    this.textInputAction,
    this.contentPadding,
    this.border,
    this.leading,
    this.autoImautomaticallyImplyLeading = false,
    this.onTapBack,
  });

  /// The visual style of the search field.
  final SearchFieldType type;

  /// Placeholder text displayed when the search field is empty.
  final String? hintText;

  /// Background color of the search field. If not provided, it will use the color
  /// determined by [type].
  final Color? fillColor;

  /// Corner radius for the search field borders. Defaults to circular (999).
  final BorderRadiusGeometry? borderRadius;

  /// Widget displayed at the start of the search field, typically for search icons.
  final Widget? prefixIcon;

  /// Widget displayed at the end of the search field, typically for clear or action buttons.
  final Widget? suffixIcon;

  /// Callback function when the search text changes.
  final void Function(String)? onChanged;

  /// Controller for the search field input.
  final TextEditingController? controller;

  /// When true, the search field will be focused when first created.
  final bool autofocus;

  /// Height of the search field container. Defaults to 48.
  final double height;

  /// Determines the action button on the keyboard (e.g., search, done).
  final TextInputAction? textInputAction;

  /// Custom padding for the content inside the search field.
  final EdgeInsetsGeometry? contentPadding;

  /// Custom border for the search field. Only applied when [type] is [SearchFieldType.withContainer].
  final BoxBorder? border;

  /// Custom widget to show at the start of the search field, typically for back navigation.
  final Widget? leading;

  /// When true, shows a default back button if no [leading] widget is provided.
  final bool autoImautomaticallyImplyLeading;

  /// Callback function when the back button is tapped.
  final void Function()? onTapBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (autoImautomaticallyImplyLeading || leading != null) ...[
            IconButton(
              onPressed: onTapBack,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              icon: leading ??
                  Icon(
                    Icons.arrow_back_ios_new,
                    size: 18,
                    color: context.color.fgMuted,
                  ),
            ),
            const SizedBox(width: 5),
          ],
          Expanded(
            child: InputField(
              hintText: hintText,
              autofocus: autofocus,
              controller: controller,
              fillColor: fillColor ?? type.bgColor(context),
              borderRadius: borderRadius ?? BorderRadius.circular(999),
              border: type == SearchFieldType.withContainer
                  ? border
                  : const Border(),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              onChanged: onChanged,
              textInputAction: textInputAction,
              contentPadding: contentPadding,
            ),
          ),
        ],
      ),
    );
  }
}

extension SearchFieldTypeExtension on SearchFieldType {
  Color? bgColor(BuildContext context) {
    switch (this) {
      case SearchFieldType.withContainer:
        return context.color.bgSubtle;
      case SearchFieldType.noContainer:
        return Colors.transparent;
    }
  }
}
