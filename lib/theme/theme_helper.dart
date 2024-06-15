import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onPrimary,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    bodyLarge: TextStyle(
      color: appTheme.black900,
      fontSize: 19.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
    ),
    bodyMedium: TextStyle(
      color: appTheme.black900,
      fontSize: 15.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
    ),
    bodySmall: TextStyle(
      color: appTheme.black900,
      fontSize: 10.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    ),
    headlineLarge: TextStyle(
      color: colorScheme.onPrimary,
      fontSize: 30.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w800,
    ),
    headlineSmall: TextStyle(
      color: appTheme.black900.withOpacity(0.8),
      fontSize: 25.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    ),
    labelLarge: TextStyle(
      color: colorScheme.onPrimary,
      fontSize: 12.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      color: appTheme.black900.withOpacity(0.7),
      fontSize: 21.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      color: appTheme.black900,
      fontSize: 17.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      color: colorScheme.onPrimary,
      fontSize: 15.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    ),
  );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XCC3357D7),
    secondaryContainer: Color(0XFFA53D3D),
    onPrimary: Color(0XFFFFFFFF),
    onPrimaryContainer: Color(0XFF3633D8),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Black
  Color get black900 => Color(0XFF000000);
// BlueE
  Color get blue700E5 => Color(0XE53375D7);
// BlueGray
  Color get blueGray400 => Color(0XFF888888);
// Gray
  Color get gray100 => Color(0XFFF5F5F5);
// GrayCc
  Color get gray50Cc => Color(0XCCF8F8F8);
// GreenFc
  Color get green600Fc => Color(0XFC49AC26);
// PinkE
  Color get pink400E5 => Color(0XE5D7339F);
// Red
  Color get red50 => Color(0XFFFDF1F1);
  Color get red700 => Color(0XFFAD4B4B);
}

