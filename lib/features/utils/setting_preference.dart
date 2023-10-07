import 'package:shared_preferences/shared_preferences.dart';

class SettingsPreference {
  static const THEME_STATUS = "THEMESTATUS";
  static const LANGUAGE_STATUS = "LANGUAGESTATUS";



  setDarkTheme(bool value) async {
    SharedPreferences themePrefs = await SharedPreferences.getInstance();
    themePrefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences themePrefs = await SharedPreferences.getInstance();
    return themePrefs.getBool(THEME_STATUS) ?? false;
  }

  setLanguage(String value) async {
    SharedPreferences LangPrefs = await SharedPreferences.getInstance();
    LangPrefs.setString(LANGUAGE_STATUS, value);
  }

  Future<String> getLanguage() async {
    SharedPreferences LangPrefs = await SharedPreferences.getInstance();
    return LangPrefs.getString(LANGUAGE_STATUS) ?? 'en';
  }
}