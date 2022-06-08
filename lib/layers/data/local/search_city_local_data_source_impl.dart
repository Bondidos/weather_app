import 'package:latlng/latlng.dart';
import 'package:weather_app/layers/data/models/remote/search_city/city_api.dart';
import 'package:weather_app/layers/data/sources/local/search_city_local_data_source.dart';
import 'package:weather_app/layers/data/sources/local/settings/search_city_settings.dart';

class SearchCityLocalDataSourceImpl implements SearchCityLocalDataSource {
  final List<CityApi> cache = [];
  final SearchCitySettings searchCitySettings;

  SearchCityLocalDataSourceImpl({required this.searchCitySettings});

  @override
  void saveCoordinatesToSettings(int index) {
    CityApi city = cache[index];
    LatLng latLng = LatLng(city.latitude, city.longitude);
    searchCitySettings.saveCityLatLang(latLng);
  }

  @override
  void saveListInMemory(List<CityApi> list) {
    cache.clear();
    cache.addAll(list);
  }
}
