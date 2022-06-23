import 'package:weather_app/layers/data/models/remote/search_city/city_api.dart';
import 'package:weather_app/layers/domain/models/search_city/city.dart';

extension Maper on List<CityApi> {
  List<City> toCityList() => map((e) => e.toCity()).toList();
}