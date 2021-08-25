import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color_palette.dart';
import '../config.dart';

//======================================
// Input Border
//======================================
OutlineInputBorder _inputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: Palette.darker.withOpacity(0.3),
      width: 1,
    ),
    borderRadius: BorderRadius.all(Radius.circular(4)),
  );
}

//======================================
// Input Theme
//======================================
InputDecorationTheme _inputTheme() {
  return InputDecorationTheme(
    isDense: true,
    labelStyle: TextStyle(
      color: Palette.dark,
    ),
    border: _inputBorder(),
    enabledBorder: _inputBorder(),
    focusedBorder: _inputBorder(),
  );
}

//======================================
// Icon Theme
//======================================
IconThemeData _iconTheme = IconThemeData(
  color: Palette.dark,
  size: 16.0,
);

//======================================
// Light Text Theme
//======================================
TextTheme _textThemeLight = TextTheme(
  headline1: TextStyle(
    fontSize: 35,
    fontFamily: Config.headingFontFamily,
    fontWeight: FontWeight.w600,
    color: Palette.darker,
  ),
  headline2: TextStyle(
    fontSize: 30,
    fontFamily: Config.headingFontFamily,
    fontWeight: FontWeight.w600,
    color: Palette.darker,
  ),
  headline3: TextStyle(
    fontSize: 25,
    fontFamily: Config.headingFontFamily,
    fontWeight: FontWeight.w600,
    color: Palette.darker,
  ),
  bodyText1: TextStyle(
    fontSize: 16.0,
    fontFamily: Config.bodyFontFamily,
    color: Palette.darker,
  ),
  bodyText2: TextStyle(
    fontSize: 14.0,
    fontFamily: Config.bodyFontFamily,
    color: Palette.darker,
  ),
  button: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    fontFamily: Config.bodyFontFamily,
    color: Palette.darker,
  ),
);

//======================================
// Light Theme
//======================================
final ThemeData lightThemeData = ThemeData(
  brightness: Brightness.light,
  iconTheme: _iconTheme,
  textTheme: _textThemeLight,
  fontFamily: GoogleFonts.raleway().fontFamily,
  scaffoldBackgroundColor: Palette.offWhite,
  backgroundColor: Palette.white,
  primaryColor: Palette.primary,
  primaryColorLight: Palette.primaryLight,
  hintColor: Palette.accent,
  accentColor: Palette.accent,
  appBarTheme: AppBarTheme(
    color: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Palette.darker),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Palette.darker,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  inputDecorationTheme: _inputTheme(),
);
