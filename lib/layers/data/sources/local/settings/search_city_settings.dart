import 'package:latlng/latlng.dart';

abstract class SearchCitySettings{
  Future<void> saveCityLatLang(LatLng latLang);
  LatLng get cityLatLng;
}