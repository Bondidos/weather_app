import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/layers/data/sources/location/location_data_source.dart';
import 'package:weather_app/layers/domain/models/coordinates/lat_lang.dart';

class LocationDataSourceImpl extends LocationDataSource {
  @override
  Future<LatLng> getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) throw Exception(S.current.LocationServiceAreDisabled);
    await _checkPermission();
    return _findCurrentPosition();
  }

  Future<void> _checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        throw Exception(S.current.NoPermissionGranted);
      }
    }
  }

  Future<LatLng> _findCurrentPosition() async {
    final Position? lastKnown = await Geolocator.getLastKnownPosition();
    final Position position;
    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
    } on TimeoutException {
      if (lastKnown != null) {
        return LatLng(lastKnown.latitude, lastKnown.longitude);
      }
      throw Exception(S.current.ExceptionTimeExpired);
    } on LocationServiceDisabledException {
      if (lastKnown != null) {
        return LatLng(lastKnown.latitude, lastKnown.longitude);
      }
      throw Exception(S.current.ExceptionCheckLocationService);
    }
    return LatLng(position.latitude, position.longitude);
  }
}
