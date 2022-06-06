import 'package:latlng/latlng.dart';
import 'package:weather_app/common/constants.dart';
import 'package:weather_app/layers/data/sources/l18n_settings.dart';
import 'package:weather_app/layers/data/sources/location_data_source.dart';
import 'package:weather_app/layers/data/remote/api_query_generator/api_keys.dart'
    as key;
import 'package:weather_app/layers/data/remote/api_query_generator/api_query_parameters.dart'
    as param;

class ApiQueryGenerator {
  final LocationDataSource locationDataSource;
  final LocalisationSettings localisationSettings;

  const ApiQueryGenerator({
    required this.locationDataSource,
    required this.localisationSettings,
  });

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
}
