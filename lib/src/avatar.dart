import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';
import 'package:nucleus_ui/extension/string.dart';
import 'package:nucleus_ui/src/stacked.dart';

/// A circular avatar widget that displays user images with various configurations and layouts.
///
/// The Avatar widget supports different sizes, error handling, and multiple layout variants:
/// - Basic avatar with just an image
/// - Meta layout with title and subtitle
/// - Content layout with reversed image position
/// - Stacked layout for displaying multiple avatars
class Avatar extends StatelessWidget {
  /// Creates a basic avatar widget.
  ///
  /// [image] can be either a network URL or an asset path.
  /// [errorImage] is displayed when the image fails to load.
  /// [size] determines the avatar dimensions (defaults to [AvatarSize.md]).
  /// [backgroundColor] customizes the background color.
  const Avatar({
    super.key,
    required this.image,
    this.errorImage,
    this.size = AvatarSize.md,
    this.backgroundColor,
  });

  final String image;
  final Widget? errorImage;
  final AvatarSize size;
  final Color? backgroundColor;

  /// Creates an avatar with metadata layout.
  ///
  /// Displays the avatar on the left with [title] and optional [subtitle] on the right.
  /// Useful for user profile displays or list items.
  ///
  /// Example:
  /// ```dart
  /// Avatar.meta(
  ///   image: 'user_avatar.png',
  ///   title: 'John Doe',
  ///   subtitle: 'Designer',
  /// )
  /// ```
  static Widget meta({
    required String image,
    required String title,
    String? subtitle,
    Widget? errorImage,
    AvatarSize size = AvatarSize.md,
    Color? backgroundColor,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
  }) {
    return Row(
      spacing: 12,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar(
          image: image,
          errorImage: errorImage,
          size: size,
          backgroundColor: backgroundColor,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: titleStyle ?? AppFonts.semiBold16,
            ),
            if (subtitle != null)
              Text(
                subtitle,
                style: subtitleStyle ??
                    AppFonts.regular12.copyWith(color: const Color(0xFF6E7375)),
              ),
          ],
        ),
      ],
    );
  }

  /// Creates an avatar with content layout.
  ///
  /// Displays text content on the left and avatar on the right.
  /// Useful for chat bubbles or content previews.
  ///
  /// Example:
  /// ```dart
  /// Avatar.content(
  ///   image: 'project_image.png',
  ///   title: 'Project Update',
  ///   subtitle: 'Latest changes...',
  /// )
  /// ```
  static Widget content({
    required String image,
    required String title,
    String? subtitle,
    Widget? errorImage,
    AvatarSize size = AvatarSize.md,
    Color? backgroundColor,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
  }) {
    return Row(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: titleStyle ?? AppFonts.semiBold16,
              ),
              if (subtitle != null)
                Text(
                  subtitle,
                  style: subtitleStyle ??
                      AppFonts.regular14
                          .copyWith(color: const Color(0xFF6E7375)),
                ),
            ],
          ),
        ),
        Avatar(
          image: image,
          errorImage: errorImage,
          size: size,
          backgroundColor: backgroundColor,
        ),
      ],
    );
  }

  /// Creates a stacked layout of multiple avatars.
  ///
  /// Displays overlapping avatars with an optional counter for additional items.
  /// Useful for showing group members or multiple participants.
  ///
  /// [images] - List of image paths or URLs
  /// [limit] - Maximum number of visible avatars (defaults to 5)
  /// [label] - Optional text label shown after the stack
  ///
  /// Example:
  /// ```dart
  /// Avatar.stacked(
  ///   images: ['user1.jpg', 'user2.jpg', 'user3.jpg'],
  ///   limit: 2,
  ///   label: '3 members',
  /// )
  /// ```
  static Widget stacked({
    required List<String> images,
    int limit = 5,
    String? label,
    Widget? errorImage,
    AvatarSize size = AvatarSize.md,
    Color? backgroundColor,
    TextStyle? counterStyle,
  }) {
    return Row(
      spacing: 12,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stacked(
          size: size.radius,
          xShift: size.radius / 2.3,
          items: images.take(limit + 1).toList().asMap().entries.map((e) {
            return Container(
              width: size.radius,
              height: size.radius,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
              ),
              child: Visibility(
                visible: e.key < limit,
                replacement: CircleAvatar(
                  backgroundColor: backgroundColor ?? const Color(0xFFDDD6FF),
                  child: Text(
                    '+${images.length - limit}',
                    style: counterStyle ??
                        AppFonts.bold18.copyWith(
                          fontSize: size.radius / 2.5,
                          color: const Color(0xFF846AFB),
                        ),
                  ),
                ),
                child: Avatar(
                  image: e.value,
                  errorImage: errorImage,
                  size: size,
                  backgroundColor: backgroundColor,
                ),
              ),
            );
          }).toList(),
        ),
        if (label != null)
          Text(
            label,
            style: AppFonts.regular14,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var isError = false;

    return StatefulBuilder(builder: (context, setState) {
      if (isError) {
        return CircleAvatar(
          radius: size.radius / 2,
          backgroundColor: context.color.accentSubtle,
          child: _fallbackImage(context),
        );
      }

      return CircleAvatar(
        radius: size.radius / 2,
        backgroundColor: backgroundColor ?? context.color.accentSubtle,
        backgroundImage: isError
            ? null
            : image.isValidUrl
                ? NetworkImage(image)
                : AssetImage(image) as ImageProvider,
        onBackgroundImageError: (_, __) async {
          await Future<void>.delayed(const Duration(milliseconds: 100));
          setState(() => isError = true);
        },
        child: isError ? _fallbackImage(context) : null,
      );
    });
  }

  /// Creates a fallback widget shown when the image fails to load.
  ///
  /// Returns either the provided [errorImage] or a default person icon.
  Widget _fallbackImage(BuildContext context) {
    return errorImage ??
        Icon(
          Icons.person_outline,
          size: size.radius * 0.5,
          color: context.color.accentModerate,
        );
  }
}

/// Defines the available sizes for the Avatar widget.
///
/// - xs: 24px diameter
/// - sm: 32px diameter
/// - md: 40px diameter (default)
/// - lg: 48px diameter
/// - xl: 64px diameter
/// - xxl: 80px diameter
enum AvatarSize { xs, sm, md, lg, xl, xxl }

/// Extension providing size calculations for [AvatarSize].
extension AvatarSizeExtension on AvatarSize {
  /// Returns the radius in logical pixels for the avatar size.
  double get radius {
    switch (this) {
      case AvatarSize.xs:
        return 24;
      case AvatarSize.sm:
        return 32;
      case AvatarSize.md:
        return 40;
      case AvatarSize.lg:
        return 48;
      case AvatarSize.xl:
        return 64;
      case AvatarSize.xxl:
        return 80;
    }
  }
}
