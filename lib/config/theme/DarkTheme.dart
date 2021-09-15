import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ColorPalette.dart';
import '../Config.dart';

//======================================
// Dark Input Border
//======================================
OutlineInputBorder _inputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: Palette.offWhite.withOpacity(0.3),
      width: 1,
    ),
    borderRadius: BorderRadius.all(Radius.circular(4)),
  );
}

//======================================
// Dark Input Theme
//======================================
InputDecorationTheme _inputTheme() {
  return InputDecorationTheme(
    isDense: true,
    labelStyle: TextStyle(
      color: Palette.offWhite,
    ),
    border: _inputBorder(),
    enabledBorder: _inputBorder(),
    focusedBorder: _inputBorder(),
  );
}

//======================================
// Dark Icon Theme
//======================================
IconThemeData _iconTheme = IconThemeData(
  color: Palette.offWhite,
  size: 16.0,
);

//======================================
// Dark Text Theme
//======================================
TextTheme _textThemeDark = TextTheme(
  headline1: TextStyle(
    fontSize: 30,
    fontFamily: Config.headingFontFamily,
    fontWeight: FontWeight.w600,
    color: Palette.white,
  ),
  headline2: TextStyle(
    fontSize: 25,
    fontFamily: Config.headingFontFamily,
    fontWeight: FontWeight.w600,
    color: Palette.white,
  ),
  headline3: TextStyle(
    fontSize: 20,
    fontFamily: Config.headingFontFamily,
    fontWeight: FontWeight.w600,
    color: Palette.white,
  ),
  bodyText1: TextStyle(
    fontSize: 16.0,
    fontFamily: Config.bodyFontFamily,
    color: Palette.offWhite,
  ),
  bodyText2: TextStyle(
    fontSize: 14.0,
    fontFamily: Config.bodyFontFamily,
    color: Palette.offWhite,
  ),
  button: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    fontFamily: Config.bodyFontFamily,
    color: Palette.offWhite,
  ),
);

//======================================
// Dark Theme
//======================================
final ThemeData darkThemeData = ThemeData(
  brightness: Brightness.dark,
  iconTheme: _iconTheme,
  textTheme: _textThemeDark,
  fontFamily: GoogleFonts.raleway().fontFamily,
  scaffoldBackgroundColor: Palette.darker,
  backgroundColor: Palette.dark,
  primaryColor: Palette.primary,
  primaryColorLight: Palette.primaryLight,
  hintColor: Palette.accent,
  accentColor: Palette.accent,
  buttonColor: Palette.accent,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      backgroundColor: Palette.accent,
    ),
  ),
  buttonTheme: ButtonThemeData(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
  ),
  appBarTheme: AppBarTheme(
    color: Palette.darkest,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Palette.offWhite),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Palette.offWhite,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  inputDecorationTheme: _inputTheme(),
);
