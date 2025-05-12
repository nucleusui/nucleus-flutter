import 'package:flutter/widgets.dart';

const kDefaultFontFamily = 'packages/nucleus_ui/Figtree';

class AppFonts {
  // Helper method to determine font family based on current language
  static TextStyle _getTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    double? height,
    double letterSpacing = 0,
  }) {
    return TextStyle(
      fontFamily: kDefaultFontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle get thin10 {
    return _getTextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w100,
    );
  }

  static TextStyle get thin12 {
    return _getTextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w100,
    );
  }

  static TextStyle get thin14 {
    return _getTextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w100,
    );
  }

  static TextStyle get thin16 {
    return _getTextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w100,
    );
  }

  static TextStyle get thin18 {
    return _getTextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w100,
    );
  }

  static TextStyle get thin20 {
    return _getTextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w100,
    );
  }

  static TextStyle get thin24 {
    return _getTextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w100,
    );
  }

  static TextStyle get thin26 {
    return _getTextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w100,
    );
  }

  static TextStyle get thin28 {
    return _getTextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w100,
    );
  }

  static TextStyle get thin30 {
    return _getTextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w100,
    );
  }

  static TextStyle get thin32 {
    return _getTextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w100,
    );
  }

  static TextStyle get thin34 {
    return _getTextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w100,
    );
  }

  static TextStyle get thin36 {
    return _getTextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w100,
    );
  }

  static TextStyle get extraLight10 {
    return _getTextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w200,
    );
  }

  static TextStyle get extraLight12 {
    return _getTextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w200,
    );
  }

  static TextStyle get extraLight14 {
    return _getTextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w200,
    );
  }

  static TextStyle get extraLight16 {
    return _getTextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w200,
    );
  }

  static TextStyle get extraLight18 {
    return _getTextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w200,
    );
  }

  static TextStyle get extraLight20 {
    return _getTextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w200,
    );
  }

  static TextStyle get extraLight24 {
    return _getTextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w200,
    );
  }

  static TextStyle get extraLight26 {
    return _getTextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w200,
    );
  }

  static TextStyle get extraLight28 {
    return _getTextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w200,
    );
  }

  static TextStyle get extraLight30 {
    return _getTextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w200,
    );
  }

  static TextStyle get extraLight32 {
    return _getTextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w200,
    );
  }

  static TextStyle get extraLight34 {
    return _getTextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w200,
    );
  }

  static TextStyle get extraLight36 {
    return _getTextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w200,
    );
  }

  static TextStyle get light10 {
    return _getTextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle get light12 {
    return _getTextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle get light14 {
    return _getTextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle get light16 {
    return _getTextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle get light18 {
    return _getTextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle get light20 {
    return _getTextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle get light24 {
    return _getTextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle get light26 {
    return _getTextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle get light28 {
    return _getTextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle get light30 {
    return _getTextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle get light32 {
    return _getTextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle get light34 {
    return _getTextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle get light36 {
    return _getTextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle get regular10 {
    return _getTextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get regular12 {
    return _getTextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get regular14 {
    return _getTextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get regular16 {
    return _getTextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get regular18 {
    return _getTextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get regular20 {
    return _getTextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get regular24 {
    return _getTextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get regular26 {
    return _getTextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get regular28 {
    return _getTextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get regular30 {
    return _getTextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get regular32 {
    return _getTextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get regular34 {
    return _getTextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get regular36 {
    return _getTextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get medium10 {
    return _getTextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get medium12 {
    return _getTextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get medium14 {
    return _getTextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get medium16 {
    return _getTextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get medium18 {
    return _getTextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get medium20 {
    return _getTextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get medium24 {
    return _getTextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get medium26 {
    return _getTextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get medium28 {
    return _getTextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get medium30 {
    return _getTextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get medium32 {
    return _getTextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get medium34 {
    return _getTextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get medium36 {
    return _getTextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get semiBold10 {
    return _getTextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get semiBold12 {
    return _getTextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get semiBold14 {
    return _getTextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get semiBold16 {
    return _getTextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.2,
    );
  }

  static TextStyle get semiBold18 {
    return _getTextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get semiBold20 {
    return _getTextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get semiBold24 {
    return _getTextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get semiBold26 {
    return _getTextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get semiBold28 {
    return _getTextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get semiBold30 {
    return _getTextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get semiBold32 {
    return _getTextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get semiBold34 {
    return _getTextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get semiBold36 {
    return _getTextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get bold10 {
    return _getTextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get bold12 {
    return _getTextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get bold14 {
    return _getTextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get bold16 {
    return _getTextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get bold18 {
    return _getTextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get bold20 {
    return _getTextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get bold24 {
    return _getTextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get bold26 {
    return _getTextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get bold28 {
    return _getTextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get bold30 {
    return _getTextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get bold32 {
    return _getTextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get bold34 {
    return _getTextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get bold36 {
    return _getTextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get extraBold10 {
    return _getTextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle get extraBold12 {
    return _getTextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle get extraBold14 {
    return _getTextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle get extraBold16 {
    return _getTextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle get extraBold18 {
    return _getTextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle get extraBold20 {
    return _getTextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle get extraBold24 {
    return _getTextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle get extraBold26 {
    return _getTextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle get extraBold28 {
    return _getTextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle get extraBold30 {
    return _getTextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle get extraBold32 {
    return _getTextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle get extraBold34 {
    return _getTextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle get extraBold36 {
    return _getTextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle get black10 {
    return _getTextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle get black12 {
    return _getTextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle get black14 {
    return _getTextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle get black16 {
    return _getTextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle get black18 {
    return _getTextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle get black20 {
    return _getTextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle get black24 {
    return _getTextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle get black26 {
    return _getTextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle get black28 {
    return _getTextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle get black30 {
    return _getTextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle get black32 {
    return _getTextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle get black34 {
    return _getTextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle get black36 {
    return _getTextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w900,
    );
  }
}
