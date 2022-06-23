import 'package:weather_app/layers/domain/models/search_city/city.dart';

abstract class SearchCityRepository{
  Future<List<City>> searchCityByName(String search);
  Future<void> savePickedCityCoordinates(int index);
}