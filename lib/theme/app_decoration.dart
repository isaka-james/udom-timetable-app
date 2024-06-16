import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGrayCc => BoxDecoration(
    color: appTheme.gray50Cc,
  );
  static BoxDecoration get fillGreenFc => BoxDecoration(
    color: appTheme.green600Fc,
  );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
    color: theme.colorScheme.onPrimary,
  );
  static BoxDecoration get fillPrimary => BoxDecoration(
    color: theme.colorScheme.primary.withOpacity(0.65),
  );
  static BoxDecoration get fillPrimary1 => BoxDecoration(
    color: theme.colorScheme.primary,
  );
  static BoxDecoration get fillRed => BoxDecoration(
    color: appTheme.red50,
  );
  static BoxDecoration get fillRed700 => BoxDecoration(
    color: appTheme.red700,
  );

  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
    color: appTheme.gray100,
  );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder15 => BorderRadius.circular(
    15.h,
  );
  static BorderRadius get circleBorder42 => BorderRadius.circular(
    42.h,
  );
// Custom borders
  static BorderRadius get customBorderBR15 => BorderRadius.only(
    bottomRight: Radius.circular(15.h),
  );
  static BorderRadius get customBorderLR10 => BorderRadius.horizontal(
    right: Radius.circular(10.h),
  );
  static BorderRadius get customBorderTL20 => BorderRadius.vertical(
    top: Radius.circular(20.h),
  );

  // Circle borders
  static BorderRadius get circleBorder48 => BorderRadius.circular(
    48.h,
  );
// Custom borders
//   static BorderRadius get customBorderBR15 => BorderRadius.only(
//     bottomRight: Radius.circular(15.h),
//   );
  static BorderRadius get customBorderLR15 => BorderRadius.horizontal(
    right: Radius.circular(15.h),
  );
  // static BorderRadius get customBorderTL20 => BorderRadius.vertical(
  //   top: Radius.circular(20.h),
  // );

  // Custom borders
  static BorderRadius get customBorderBL44 => BorderRadius.vertical(
    bottom: Radius.circular(44.h),
  );
// Rounded borders
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
    20.h,
  );
  static BorderRadius get roundedBorder24 => BorderRadius.circular(
    24.h,
  );
}

