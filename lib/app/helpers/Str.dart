class Str {
  // Create first letter of any string uppercase
  static String ucFirst(String str) {
    return str[0].toUpperCase() + str.substring(1);
  }

  // Create slug from given string
  static String slug(String str) {
    return str.trim().replaceAll("  ", " ").replaceAll(" ", "-").toLowerCase();
  }

  // Covert given String to lowercase
  static String toLower(String str) {
    return str.toLowerCase();
  }

  // Covert given String to uppercase
  static String toUpper(String str) {
    return str.toUpperCase();
  }
}
