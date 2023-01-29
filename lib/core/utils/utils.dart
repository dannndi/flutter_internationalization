import 'dart:ui';

class Utils {
  static String localeToCountryName(Locale locale) {
    switch (locale.languageCode) {
      case "en":
        return "English";
      case "id":
        return "Indonesia";
      default:
        return "English";
    }
  }
}
