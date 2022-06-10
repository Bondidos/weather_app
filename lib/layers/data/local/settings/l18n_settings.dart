import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/common/constants.dart';
import 'package:weather_app/layers/data/sources/local/settings/l18n_settings.dart';

const currentLanguageKey = "current language";

class LocalisationSettingsImpl extends LocalisationSettings {
  final SharedPreferences sharedPreferences;

  LocalisationSettingsImpl({
    required this.sharedPreferences,
  }) {
    final String defaultLocale = Platform.localeName;
    (defaultLocale.contains(languageEnglish))
        ? _setEnglishLanguage()
        : _setRussianLanguage();
  }

  @override
  String get currentLanguage =>
      sharedPreferences.getString(currentLanguageKey) ?? notPicked;

  void _setRussianLanguage() =>
      sharedPreferences.setString(currentLanguageKey, languageRussian);

  void _setEnglishLanguage() =>
      sharedPreferences.setString(currentLanguageKey, languageEnglish);
}
