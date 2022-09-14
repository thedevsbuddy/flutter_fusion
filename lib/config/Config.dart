import 'package:google_fonts/google_fonts.dart';

import '../routes/Routes.dart';

class Config {
  ///======================================
  /// Is Auth Required In App
  ///======================================
  static bool authRequired = true;

  ///======================================
  /// Debug Mode
  ///======================================
  static bool inDebug = true;

  ///======================================
  /// API base url
  ///======================================
  static String apiBaseUrl = "https://api.example.com/v1";

  ///======================================
  /// App Name
  ///======================================
  static String appName = "Flutter MVC Kit";

  ///======================================
  /// Home/Dashboard URL [To be used to redirect user after login]
  ///======================================
  static String homeUrl = Routes.dashboard;

  ///======================================
  /// Font Family For The Headings And Titles
  ///======================================
  static String? headingFontFamily = GoogleFonts.raleway().fontFamily;

  ///======================================
  /// Font Family For The Body Text
  ///======================================
  static String? bodyFontFamily = GoogleFonts.poppins().fontFamily;

  ///======================================
  /// Design screen width
  ///======================================
  static double screenWidth = 375.0;

  ///======================================
  /// Design screen height
  ///======================================
  static double screenHeight = 812.0;
}
