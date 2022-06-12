import 'dart:io';

import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/common/constants.dart';
import 'package:weather_app/layers/data/sources/local/settings/l18n_settings.dart';

const currentLanguageKey = "current language";

class LocalisationSettingsImpl extends LocalisationSettings {
  final SharedPreferences sharedPreferences;

  LocalisationSettingsImpl({
    required this.sharedPreferences,
  }) {
    _syncLanguage;
  }

  PublishSubject<String> languageStream = PublishSubject<String>();

  @override
  String get currentLanguage =>
      sharedPreferences.getString(currentLanguageKey) ?? notPicked;

  void _syncLanguage() {
    final String defaultLocale = Platform.localeName;
    (defaultLocale.contains(languageEnglish))
        ? setEnglishLanguage()
        : setRussianLanguage();
  }

  @override
  void setRussianLanguage() {
    sharedPreferences.setString(currentLanguageKey, languageRussian);
    languageStream.add(languageRussian);
  }

  @override
  void setEnglishLanguage() {
    sharedPreferences.setString(currentLanguageKey, languageEnglish);
    languageStream.add(languageEnglish);
  }

  @override
  Stream<String> subscribeLanguageChanged() => languageStream;
}
