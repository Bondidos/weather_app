import 'package:weather_app/layers/domain/models/coordinates/lat_lang.dart';

abstract class SearchCitySettings{
  Future<void> saveCityLatLang(LatLng latLang);
  LatLng get cityLatLng;
}