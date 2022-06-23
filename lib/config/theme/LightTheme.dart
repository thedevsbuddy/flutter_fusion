import 'package:ui_x/ui_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvc/app/helpers/Global.dart';

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
        height: 1,
        fontSize: 14,
        color: kcDark.withOpacity(0.5),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: spacer3, horizontal: spacer4),
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
  headline4: TextStyle(
    fontFamily: Config.headingFontFamily,
    fontWeight: FontWeight.w600,
    color: kcWhite,
  ),
  headline5: TextStyle(
    fontFamily: Config.headingFontFamily,
    fontWeight: FontWeight.w600,
    color: kcWhite,
  ),
  headline6: TextStyle(
    fontFamily: Config.headingFontFamily,
    fontWeight: FontWeight.w600,
    color: kcWhite,
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
  scaffoldBackgroundColor: kcOffWhite,
  backgroundColor: kcWhite,
  primaryColor: kcPrimary,
  primaryColorLight: kcPrimaryLight,
  primarySwatch: generateMaterialColor(kcPrimary),
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
    backgroundColor: kcPrimary,
    iconTheme: IconThemeData(color: kcOffWhite),
    toolbarTextStyle: TextTheme(
      headline6: TextStyle(
        color: kcOffWhite,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ).headline6,
    titleTextStyle: TextTheme(
      headline6: TextStyle(
        color: kcOffWhite,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ).headline6,
  ),
  inputDecorationTheme: _inputTheme(),
);
