import 'package:basic_ui/basic_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Config.dart';

//======================================
// Input Border
//======================================
OutlineInputBorder _inputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: kcDarker.withOpacity(0.3),
      width: 1,
    ),
    borderRadius: BorderRadius.all(Radius.circular(4)),
  );
}

//======================================
// Input Error Border
//======================================
OutlineInputBorder _inputErrorBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: kcDanger.withOpacity(0.3),
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
      filled: true,
      fillColor: kcWhite,
      labelStyle: TextStyle(
        color: kcDark,
      ),
      hintStyle: TextStyle(
        color: kcDark.withOpacity(0.5),
      ),
      prefixStyle: TextStyle(
        color: kcDark,
      ),
      border: _inputBorder(),
      enabledBorder: _inputBorder(),
      focusedBorder: _inputBorder(),
      errorBorder: _inputErrorBorder());
}

//======================================
// Icon Theme
//======================================
IconThemeData _iconTheme = IconThemeData(
  color: kcDark,
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
    color: kcDarker,
  ),
  headline2: TextStyle(
    fontSize: 30,
    fontFamily: Config.headingFontFamily,
    fontWeight: FontWeight.w600,
    color: kcDarker,
  ),
  headline3: TextStyle(
    fontSize: 25,
    fontFamily: Config.headingFontFamily,
    fontWeight: FontWeight.w600,
    color: kcDarker,
  ),
  bodyText1: TextStyle(
    fontSize: 16.0,
    fontFamily: Config.bodyFontFamily,
    color: kcDarker,
  ),
  bodyText2: TextStyle(
    fontSize: 14.0,
    fontFamily: Config.bodyFontFamily,
    color: kcDarker,
  ),
  button: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    fontFamily: Config.bodyFontFamily,
    color: kcOffWhite,
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
  scaffoldBackgroundColor: kcOffWhite,
  backgroundColor: kcWhite,
  primaryColor: kcPrimary,
  primaryColorLight: kcPrimaryLight,
  hintColor: kcAccent,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      backgroundColor: kcPrimary,
    ),
  ),
  buttonTheme: ButtonThemeData(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    iconTheme: IconThemeData(color: kcOffWhite),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: kcOffWhite,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  inputDecorationTheme: _inputTheme(),
);
