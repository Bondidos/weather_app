import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:latlng/latlng.dart';
import 'package:weather_app/layers/data/sources/location/location_data_source.dart';

class LocationDataSourceImpl extends LocationDataSource {
  LocationDataSourceImpl();

  @override
  Future<LatLng> getCurrentPosition() async {
    await _checkPermission();
    return _findCurrentPosition();
  }

  Future<void> _checkPermission() async {
    final LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw Exception('No Permission Granted');
    }
  }

  Future<LatLng> _findCurrentPosition() async {
    final Position position;
    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
    } on TimeoutException {
      throw Exception('Can not get Location. Time expired');
    } on LocationServiceDisabledException {
      throw Exception('Please, check is Location Service enabled');
    }
    return LatLng(position.latitude, position.longitude);
  }
}
