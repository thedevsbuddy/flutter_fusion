import 'package:basic_ui/basic_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Config.dart';

//======================================
// Dark Input Border
//======================================
OutlineInputBorder _inputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: kcOffWhite.withOpacity(0.3),
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
      color: kcOffWhite,
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
  color: kcOffWhite,
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
    color: kcWhite,
  ),
  headline2: TextStyle(
    fontSize: 25,
    fontFamily: Config.headingFontFamily,
    fontWeight: FontWeight.w600,
    color: kcWhite,
  ),
  headline3: TextStyle(
    fontSize: 20,
    fontFamily: Config.headingFontFamily,
    fontWeight: FontWeight.w600,
    color: kcWhite,
  ),
  bodyText1: TextStyle(
    fontSize: 16.0,
    fontFamily: Config.bodyFontFamily,
    color: kcOffWhite,
  ),
  bodyText2: TextStyle(
    fontSize: 14.0,
    fontFamily: Config.bodyFontFamily,
    color: kcOffWhite,
  ),
  button: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    fontFamily: Config.bodyFontFamily,
    color: kcOffWhite,
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
  scaffoldBackgroundColor: kcDarker,
  backgroundColor: kcDark,
  primaryColor: kcPrimary,
  primaryColorLight: kcPrimaryLight,
  hintColor: kcAccent,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      backgroundColor: kcAccent,
    ),
  ),
  buttonTheme: ButtonThemeData(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
  ),
  appBarTheme: AppBarTheme(
    color: kcDarkest,
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
