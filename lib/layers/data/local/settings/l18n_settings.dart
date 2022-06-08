import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/common/constants.dart';
import 'package:weather_app/layers/data/sources/local/settings/l18n_settings.dart';

const currentLanguageKey = "current language";

class LocalisationSettingsImpl extends LocalisationSettings {
  final SharedPreferences sharedPreferences;

  LocalisationSettingsImpl({
    required this.sharedPreferences,
  });

  @override
  String get currentLanguage =>
      sharedPreferences.getString(currentLanguageKey) ?? notPicked;

  @override
  void setRussianLanguage() =>
      sharedPreferences.setString(currentLanguageKey, languageRussian);

  @override
  void setEnglishLanguage() =>
      sharedPreferences.setString(currentLanguageKey, languageEnglish);
}
