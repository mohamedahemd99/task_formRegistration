import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/l10n.dart';
import '../local/cache_helper.dart';

class localeProvider extends ChangeNotifier {
  // Locale _locale = Locale(CacheHelper.getData(key: 'lang') ?? "en");
  String selectLangValue = CacheHelper.getData(key: 'lang') ?? "en";

  Locale _locale = Locale(CacheHelper.getData(key: 'lang') ?? "en");

  void changeLang(String value) {
    selectLangValue = value;
    CacheHelper.putData(key: 'lang', value: selectLangValue);
    notifyListeners();
  }

  bool darkTheme = false;

  void changeTheme(bool value) {
    darkTheme = value;

    notifyListeners();
  }

  var tm = ThemeMode.system;

  String themeText = 's';

  themeModeChange(newThemeMode) async {
    tm = newThemeMode;

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("themeText", themeText);
    notifyListeners();
  }

  getThemeMode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    themeText = preferences.getString("themeText") ?? "s";
    if (themeText == 'd') {
      tm = ThemeMode.dark;
    } else if (themeText == 'l') {
      tm = ThemeMode.light;
    } else if (themeText == 's') {
      tm = ThemeMode.system;
    }
    notifyListeners();
  }

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }
// void clearLocale(){
//   _locale=null;
//   notifyListeners();
// }
}
