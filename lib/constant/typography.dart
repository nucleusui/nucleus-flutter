import 'package:flutter/material.dart';

class AppTypography {
  // Font Families
  static const String fontFamilyPrimary = 'Plus Jakarta Sans';
  static const String fontFamilySecondary = 'Plus Jakarta Sans';

  // Font Weights
  static const FontWeight fontLight = FontWeight.w300;
  static const FontWeight fontRegular = FontWeight.w400; // Body text
  static const FontWeight fontMedium = FontWeight.w500;
  static const FontWeight fontSemibold = FontWeight.w600;
  static const FontWeight fontBold = FontWeight.w700; // Display, Heading, Label

  // Font Sizes
  static const double fontSizeXs = 12; // XS for body, label, heading 6
  static const double fontSizeSm = 14; // SM for body, label, heading 5
  static const double fontSizeMd = 16; // MD for body, label, heading 4
  static const double fontSizeLg = 18; // LG for body, label, heading 3
  static const double fontSizeXl = 24; // Heading 2
  static const double fontSize2xl = 32; // Heading 1
  static const double fontSize3xl = 40; // Display 1
  static const double fontSize4xl = 64; // Display 2

  // Letter Spacing
  static const double letterSpacingNone = 0;
}

class AppFonts {
  // display style
  static const TextStyle display1 = TextStyle(
    fontSize: AppTypography.fontSize4xl,
    fontWeight: AppTypography.fontBold,
    letterSpacing: AppTypography.letterSpacingNone,
  );
  static const TextStyle display2 = TextStyle(
    fontSize: AppTypography.fontSize3xl,
    fontWeight: AppTypography.fontBold,
    letterSpacing: AppTypography.letterSpacingNone,
  );

  // heading style
  static const TextStyle h1 = TextStyle(
    fontSize: AppTypography.fontSize2xl,
    fontWeight: AppTypography.fontBold,
    letterSpacing: AppTypography.letterSpacingNone,
  );
  static const TextStyle h2 = TextStyle(
    fontSize: AppTypography.fontSizeXl,
    fontWeight: AppTypography.fontBold,
    letterSpacing: AppTypography.letterSpacingNone,
  );
  static const TextStyle h3 = TextStyle(
    fontSize: AppTypography.fontSizeLg,
    fontWeight: AppTypography.fontBold,
    letterSpacing: AppTypography.letterSpacingNone,
  );
  static const TextStyle h4 = TextStyle(
    fontSize: AppTypography.fontSizeMd,
    fontWeight: AppTypography.fontBold,
    letterSpacing: AppTypography.letterSpacingNone,
  );
  static const TextStyle h5 = TextStyle(
    fontSize: AppTypography.fontSizeSm,
    fontWeight: AppTypography.fontBold,
    letterSpacing: AppTypography.letterSpacingNone,
  );
  static const TextStyle h6 = TextStyle(
    fontSize: AppTypography.fontSizeXs,
    fontWeight: AppTypography.fontBold,
    letterSpacing: AppTypography.letterSpacingNone,
  );

  // body style
  static const TextStyle bodyLg = TextStyle(
    fontSize: AppTypography.fontSizeLg,
    fontWeight: AppTypography.fontRegular,
    letterSpacing: AppTypography.letterSpacingNone,
  );
  static const TextStyle bodyMd = TextStyle(
    fontSize: AppTypography.fontSizeMd,
    fontWeight: AppTypography.fontRegular,
    letterSpacing: AppTypography.letterSpacingNone,
  );
  static const TextStyle bodySm = TextStyle(
    fontSize: AppTypography.fontSizeSm,
    fontWeight: AppTypography.fontRegular,
    letterSpacing: AppTypography.letterSpacingNone,
  );
  static const TextStyle bodyXs = TextStyle(
    fontSize: AppTypography.fontSizeXs,
    fontWeight: AppTypography.fontRegular,
    letterSpacing: AppTypography.letterSpacingNone,
  );

  // label style
  static const TextStyle labelLg = TextStyle(
    fontSize: AppTypography.fontSizeLg,
    fontWeight: AppTypography.fontBold,
    letterSpacing: AppTypography.letterSpacingNone,
  );
  static const TextStyle labelMd = TextStyle(
    fontSize: AppTypography.fontSizeMd,
    fontWeight: AppTypography.fontBold,
    letterSpacing: AppTypography.letterSpacingNone,
  );
  static const TextStyle labelSm = TextStyle(
    fontSize: AppTypography.fontSizeSm,
    fontWeight: AppTypography.fontBold,
    letterSpacing: AppTypography.letterSpacingNone,
  );
  static const TextStyle labelXs = TextStyle(
    fontSize: AppTypography.fontSizeXs,
    fontWeight: AppTypography.fontBold,
    letterSpacing: AppTypography.letterSpacingNone,
  );
}
