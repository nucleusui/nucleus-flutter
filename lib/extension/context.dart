import 'package:flutter/material.dart';

extension AppContext on BuildContext {
  /// Returns the current theme of the app.
  ThemeData get theme => Theme.of(this);

  /// Returns the current color scheme of the app.
  ColorScheme get color => theme.colorScheme;

  /// Returns the current size of the screen.
  Size get sizeOf => MediaQuery.maybeSizeOf(this) ?? Size.zero;
  EdgeInsets get paddingOf =>
      MediaQuery.maybePaddingOf(this) ?? EdgeInsets.zero;
  EdgeInsets get viewPaddingOf =>
      MediaQuery.maybeViewPaddingOf(this) ?? EdgeInsets.zero;
  EdgeInsets get viewInsetsOf =>
      MediaQuery.maybeViewInsetsOf(this) ?? EdgeInsets.zero;

  // Get the screen size and padding
  double get screenWidth => sizeOf.width;
  double get screenHeight => sizeOf.height;
  double get padTop => paddingOf.top;
  double get padBottom => paddingOf.bottom;

  // Extra padding for devices without notches to keep the UI consistent
  double get extraPadBottom => viewPaddingOf.bottom > 0 ? 0 : 10;

  /// Returns a proportional height based on the screen height
  double heightBy([double value = 1]) => screenHeight * value;

  /// Returns a proportional width based on the screen height
  double widthBy([double value = 1]) => screenWidth * value;
}
