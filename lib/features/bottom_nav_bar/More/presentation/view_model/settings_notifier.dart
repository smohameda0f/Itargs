import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../../utils/setting_preference.dart';

class SettingsProvider with ChangeNotifier {
  SettingsPreference settingsPreference = SettingsPreference();
  // SettingsPreference darkThemePreference = SettingsPreference();
  bool _darkTheme = false;
  // String _arabicLang = 'en';

  bool get darkTheme => _darkTheme;
  // String get arabicLang => _arabicLang;

  set darkTheme(bool value) {
    _darkTheme = value;
    settingsPreference.setDarkTheme(value);
    notifyListeners();
  }

  // set arabicLang(String value) {
  //   _arabicLang = value;
  // }

  // void changeLang(bool value, context){
  //   if (value) {
  //     EasyLocalization.of(context)?.setLocale(Locale('ar'));
  //     arabicLang = 'ar';
  //   }   else{
  //     EasyLocalization.of(context)?.setLocale(Locale('en'));
  //     arabicLang = 'en';
  //   }
  // }

}