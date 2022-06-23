import 'package:weather_app/layers/domain/models/coordinates/lat_lang.dart';

abstract class LocationDataSource{
  Future<LatLng> getCurrentPosition();
}