import 'package:weather_app/layers/data/models/remote/search_city/city_api.dart';

abstract class SearchCityLocalDataSource{
  void saveListInMemory(List<CityApi> list);
  void saveCoordinatesToSettings(int index);
}