import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body text style
  static get bodyLarge16 => theme.textTheme.bodyLarge!.copyWith(
    fontSize: 16.fSize,
  );
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
    color: appTheme.black900.withOpacity(0.75),
  );
  static get bodyMediumOnPrimary => theme.textTheme.bodyMedium!.copyWith(
    color: theme.colorScheme.onPrimary,
  );
  static get bodySmallLight => theme.textTheme.bodySmall!.copyWith(
    fontSize: 12.fSize,
    fontWeight: FontWeight.w300,
  );
  static get bodySmallLight_1 => theme.textTheme.bodySmall!.copyWith(
    fontWeight: FontWeight.w300,
  );
// Headline text style
  static get headlineLargeBlack900 => theme.textTheme.headlineLarge!.copyWith(
    color: appTheme.black900.withOpacity(0.8),
    fontWeight: FontWeight.w600,
  );
  static get headlineSmallBlack900 => theme.textTheme.headlineSmall!.copyWith(
    color: appTheme.black900,
    fontWeight: FontWeight.w500,
  );
  static get headlineSmallBlack900_1 => theme.textTheme.headlineSmall!.copyWith(
    color: appTheme.black900,
  );
  static get headlineSmallOnPrimary => theme.textTheme.headlineSmall!.copyWith(
    color: theme.colorScheme.onPrimary,
  );
  static get headlineSmallOnPrimaryExtraBold =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w800,
      );
// Label text style
  static get labelLargeBlack900 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.black900.withOpacity(0.5),
  );
// Title text style
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.black900.withOpacity(0.67),
  );
  static get titleLargeBlack900Light => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.black900,
    fontSize: 20.fSize,
    fontWeight: FontWeight.w300,
  );
  static get titleLargeOnPrimary => theme.textTheme.titleLarge!.copyWith(
    color: theme.colorScheme.onPrimary,
  );
  static get titleMediumInterOnPrimary =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w900,
      );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.black900.withOpacity(0.7),
    fontWeight: FontWeight.w500,
  );
  static get titleSmallOnPrimary => theme.textTheme.titleSmall!.copyWith(
    color: theme.colorScheme.onPrimary.withOpacity(0.8),
    fontWeight: FontWeight.w500,
  );



  // Title text style
  static get titleLarge23 => theme.textTheme.titleLarge!.copyWith(
    fontSize: 23.fSize,
  );
  // static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
  //   color: appTheme.black900,
  // );
  static get titleLargeBlack900Bold => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.black900,
    fontSize: 23.fSize,
    fontWeight: FontWeight.w700,
  );



















  // // Body text style
  // static get bodyLarge16 => theme.textTheme.bodyLarge!.copyWith(
  //   fontSize: 16.fSize,
  // );
  // static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
  //   color: appTheme.black900.withOpacity(0.75),
  // );
  static get bodySmall10 => theme.textTheme.bodySmall!.copyWith(
    fontSize: 10.fSize,
  );
// // Headline text style
//   static get headlineLargeBlack900 => theme.textTheme.headlineLarge!.copyWith(
//     color: appTheme.black900.withOpacity(0.8),
//     fontWeight: FontWeight.w600,
//   );
//   static get headlineSmallBlack900 => theme.textTheme.headlineSmall!.copyWith(
//     color: appTheme.black900,
//     fontWeight: FontWeight.w500,
//   );
//   static get headlineSmallBlack900_1 => theme.textTheme.headlineSmall!.copyWith(
//     color: appTheme.black900.withOpacity(0.8),
//   );
  static get headlineSmallExtraBold => theme.textTheme.headlineSmall!.copyWith(
    fontWeight: FontWeight.w800,
  );
// Label text style
  static get labelLargeOnPrimary => theme.textTheme.labelLarge!.copyWith(
    color: theme.colorScheme.onPrimary,
  );
// // Title text style
//   static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
//     color: appTheme.black900.withOpacity(0.7),
//     fontSize: 21.fSize,
//     fontWeight: FontWeight.w600,
//   );
//   static get titleLargeBlack900Light => theme.textTheme.titleLarge!.copyWith(
//     color: appTheme.black900,
//     fontWeight: FontWeight.w300,
//   );
  static get titleLargeBlack900SemiBold => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.black900.withOpacity(0.67),
    fontSize: 21.fSize,
    fontWeight: FontWeight.w600,
  );
  static get titleLargeSemiBold => theme.textTheme.titleLarge!.copyWith(
    fontSize: 21.fSize,
    fontWeight: FontWeight.w600,
  );
  // static get titleMediumInterOnPrimary =>
  //     theme.textTheme.titleMedium!.inter.copyWith(
  //       color: theme.colorScheme.onPrimary,
  //       fontSize: 18.fSize,
  //       fontWeight: FontWeight.w900,
  //     );
}

