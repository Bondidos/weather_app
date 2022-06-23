abstract class LocalisationSettings{
  String get currentLanguage;
  Stream<String> subscribeLanguageChanged();
  void setRussianLanguage();
  void setEnglishLanguage();
}