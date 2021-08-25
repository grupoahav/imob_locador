import 'package:flutter/material.dart';
import 'package:imob_design_system/src/styles/imob_fonts.dart';

import '../utils/extensions/screen_extension.dart';
import 'imob_colors.dart';

class ImobThemes {
  static ThemeData get light {
    return customTheme(
      brightness: Brightness.light,
      primary: ImobColors.blue,
      primaryVariant: ImobColors.blueDark,
      onPrimary: ImobColors.white,
      secondary: ImobColors.green,
      secondaryVariant: ImobColors.greenDark,
      onSecondary: ImobColors.white,
      background: ImobColors.white,
      onBackground: ImobColors.black,
      surface: ImobColors.white,
      onSurface: ImobColors.black,
      error: ImobColors.red,
      onError: ImobColors.white,
      disabledColor: ImobColors.grey,
      fontColor: ImobColors.black,
      primarySwatch: ImobColors.blue,
    );
  }

  /// ## customTheme
  ///
  /// [brightness] :
  /// ### Primary
  /// [primary] : The color displayed most frequently across your app’s screens and components.
  /// [primaryVariant] : A darker version of the primary color.
  /// [onPrimary] : A color that's clearly legible when drawn on [primary].
  ///
  /// ### Secondary
  /// [secondary] : An accent color that, when used sparingly, calls attention to parts of your app.
  /// [secondaryVariant] : A darker version of the secondary color.
  /// [onSecondary] : A color that's clearly legible when drawn on [secondary].
  ///
  /// ### Background
  /// [background] : A color that typically appears behind scrollable content.
  /// [onBackground] : A color that typically appears behind scrollable content.
  ///
  /// ### Surface
  /// [surface] : The background color for widgets like [Card].
  /// [onSurface] : A color that's clearly legible when drawn on [surface]
  ///
  /// ### Error
  /// [error] : The color to use for input validation errors, e.g. for [InputDecoration.errorText].
  /// [onError] : A color that's clearly legible when drawn on [error].
  ///
  /// ### Misc
  /// [disabledColor]
  /// [fontColor]
  ///
  /// ### Primary Swatch
  /// [primarySwatch]
  static ThemeData customTheme({
    required Brightness brightness,
    // Primary
    required Color primary,
    required Color primaryVariant,
    required Color onPrimary,
    // Secondary
    required Color secondary,
    required Color secondaryVariant,
    required Color onSecondary,
    // Background
    required Color background,
    required Color onBackground,
    // Surface
    required Color surface,
    required Color onSurface,
    // Error
    required Color error,
    required Color onError,
    // Misc
    required Color disabledColor,
    required Color fontColor,
    required MaterialColor primarySwatch,
  }) {
    return ThemeData(
      brightness: brightness,
      primarySwatch: primarySwatch,
      primaryColor: primary,
      primaryColorLight: primarySwatch.shade50,
      primaryColorDark: primaryVariant,
      accentColor: secondary,
      backgroundColor: surface,
      scaffoldBackgroundColor: surface,
      cardColor: surface,
      disabledColor: disabledColor,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: primary,
        secondary: secondary,
        background: background,
        surface: surface,
        error: error,
        primaryVariant: primaryVariant,
        secondaryVariant: secondaryVariant,
        onBackground: onBackground,
        onPrimary: onPrimary,
        onSecondary: onSecondary,
        onError: onError,
        onSurface: onSurface,
      ),
      fontFamily: ImobFonts.josefinSans,
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 123.scale,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
          color: fontColor,
        ),
        headline2: TextStyle(
          fontSize: 77.scale,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
          color: fontColor,
        ),
        headline3: TextStyle(
          fontSize: 61.scale,
          fontWeight: FontWeight.w400,
        ),
        headline4: TextStyle(
          fontSize: 43.scale,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: fontColor,
        ),
        headline5: TextStyle(
          fontSize: 31.scale,
          fontWeight: FontWeight.w600,
          color: fontColor,
        ),
        headline6: TextStyle(
          fontSize: 26.scale,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: fontColor,
        ),
        subtitle1: TextStyle(
          fontSize: 20.scale,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.15,
          color: fontColor,
        ),
        subtitle2: TextStyle(
          fontSize: 18.scale,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: fontColor,
        ),
        bodyText1: TextStyle(
          fontSize: 20.scale,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: fontColor,
        ),
        bodyText2: TextStyle(
          fontSize: 17.scale,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: fontColor,
        ),
        button: TextStyle(
          fontSize: 18.scale,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.25,
          color: fontColor,
        ),
        caption: TextStyle(
          fontSize: 15.scale,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: fontColor,
        ),
        overline: TextStyle(
          fontSize: 13.scale,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          color: fontColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(16.scale),
        focusColor: primary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0.scale)),
          borderSide: BorderSide(
            color: fontColor,
          ),
        ),
        labelStyle: TextStyle(
          fontSize: 16.scale,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: fontColor,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: secondary,

        // unselectedItemColor: disabledColor,
        backgroundColor: background,
        selectedLabelStyle: TextStyle(
          fontSize: 12.scale,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12.scale,
          fontWeight: FontWeight.w500,
        ),
      ),
      buttonTheme: ButtonThemeData(
        height: 52.scale,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0.scale),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        elevation: 0.0,
        titleTextStyle: TextStyle(
          fontSize: 26.scale,
          fontWeight: FontWeight.w700,
          color: primary,
        ),
        iconTheme: IconThemeData(
          color: onBackground,
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 26.scale,
            fontWeight: FontWeight.w700,
            color: primary,
          ),
        ),
      ),
      iconTheme: IconThemeData(
        color: onBackground,
      ),
    );
  }
}
