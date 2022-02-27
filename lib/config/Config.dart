import 'package:google_fonts/google_fonts.dart';

class Config {
  //======================================
  // Is Auth Required In App
  //======================================
  static bool authRequired = false;

  //======================================
  // API base url
  //======================================
  static String apiBaseUrl = "https://example.com/api";

  //======================================
  // App Name
  //======================================
  static String appName = "Flutter Starter MVC";

  //======================================
  // Font Family For The Headings And Titles
  //======================================
  static String? headingFontFamily = GoogleFonts.raleway().fontFamily;

  //======================================
  // Font Family For The Body Text
  //======================================
  static String? bodyFontFamily = GoogleFonts.poppins().fontFamily;

  //======================================
  // Design screen width
  //======================================
  static double screenWidth = 375.0;

  //======================================
  // Design screen height
  //======================================
  static double screenHeight = 812.0;
}
