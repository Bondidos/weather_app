import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:latlng/latlng.dart';
import 'package:weather_app/generated/l10n.dart';
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
      throw Exception(S.current.NoPermissionGranted);
    }
  }

  Future<LatLng> _findCurrentPosition() async {
    final Position position;
    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
    } on TimeoutException {
      throw Exception(S.current.ExceptionTimeExpired);
    } on LocationServiceDisabledException {
      throw Exception(S.current.ExceptionCheckLocationService);
    }
    return LatLng(position.latitude, position.longitude);
  }
}
