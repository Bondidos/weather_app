import 'package:latlng/latlng.dart';

abstract class LocationDataSource{
  Future<LatLng> getCurrentPosition();
}