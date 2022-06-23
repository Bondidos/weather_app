import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/layers/data/sources/local/settings/search_city_settings.dart';
import 'package:weather_app/layers/domain/models/coordinates/lat_lang.dart';

const latitude = 'City lat';
const longitude = 'City lng';

class SearchCitySettingsImpl implements SearchCitySettings {
  final SharedPreferences sharedPreferences;

  SearchCitySettingsImpl({
    required this.sharedPreferences,
  });

  @override
  LatLng get cityLatLng => LatLng(
        sharedPreferences.getDouble(latitude) ?? 0,
        sharedPreferences.getDouble(longitude) ?? 0,
      );

  @override
  Future<void> saveCityLatLang(LatLng latLang) async {
    Future.wait([
      sharedPreferences.setDouble(latitude, latLang.latitude),
      sharedPreferences.setDouble(longitude, latLang.longitude),
    ]);
  }
}
