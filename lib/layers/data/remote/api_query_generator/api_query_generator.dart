import 'package:latlng/latlng.dart';
import 'package:weather_app/common/constants.dart';
import 'package:weather_app/layers/data/sources/local/settings/l18n_settings.dart';
import 'package:weather_app/layers/data/sources/local/settings/search_city_settings.dart';
import 'package:weather_app/layers/data/sources/location/location_data_source.dart';
import 'package:weather_app/layers/data/remote/api_query_generator/api_keys.dart'
    as key;
import 'package:weather_app/layers/data/remote/api_query_generator/api_query_parameters.dart'
    as param;

class ApiQueryGenerator {
  final LocationDataSource locationDataSource;
  final LocalisationSettings localisationSettings;
  final SearchCitySettings searchCitySettings;

  const ApiQueryGenerator({
    required this.locationDataSource,
    required this.localisationSettings,
    required this.searchCitySettings,
  });

  LatLng get cityLatLng => searchCitySettings.cityLatLng;

  String get currentLanguage => localisationSettings.currentLanguage;

  String get _currentMeasurement => currentLanguage == languageEnglish
      ? param.measurementImperial
      : param.measurementMetric;

  Future<Map<String, dynamic>> generateCurrentWeatherQuery() async {
    LatLng currentPosition = await locationDataSource.getCurrentPosition();
    return {
      key.longitude: currentPosition.longitude,
      key.latitude: currentPosition.latitude,
      key.measurement: _currentMeasurement,
      key.language: currentLanguage,
      key.applicationId: param.applicationKey
    };
  }

  Map<String, dynamic> generateCurrentWeatherForCityQuery() => {
      key.longitude: cityLatLng.longitude,
      key.latitude: cityLatLng.latitude,
      key.measurement: _currentMeasurement,
      key.language: currentLanguage,
      key.applicationId: param.applicationKey
    };

  Future<Map<String, dynamic>> generateHourlyWeatherForecastQuery() async {
    LatLng currentPosition = await locationDataSource.getCurrentPosition();
    return {
      key.longitude: currentPosition.longitude,
      key.latitude: currentPosition.latitude,
      key.applicationId: param.applicationKey,
      key.measurement: _currentMeasurement,
      key.language: currentLanguage,
      key.excludeFields: [
        param.alertsMessages,
        param.minutelyForecast,
        param.currentlyForecast,
      ].unpack(),
    };
  }

  Map<String, dynamic> generateSearchCityByNameQuery(
          {required String search}) =>
      {
        key.cityName: search,
        key.applicationId: param.applicationKey,
      };
}

extension UnpackList on List<String> {
  String unpack() {
    StringBuffer fields = StringBuffer();
    forEach((element) {
      fields.write(element + ',');
    });
    return fields.toString();
  }
}
