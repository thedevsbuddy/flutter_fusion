import 'package:google_fonts/google_fonts.dart';

class Config {
  //======================================
  // Is Auth Required In App
  //======================================
  static bool authRequired = true;

  //======================================
  // API base url
  //======================================
  static String apiBaseUrl = "https://api.virtualplatform.com.au/v2";

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
  static double screenWidth = 375.0; // Default iPhone design screen Width

  //======================================
  // Design screen height
  //======================================
  static double screenHeight = 812.0;
}
