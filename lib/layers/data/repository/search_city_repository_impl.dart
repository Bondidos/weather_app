import 'package:weather_app/layers/data/models/remote/search_city/city_api.dart';
import 'package:weather_app/layers/data/sources/local/search_city_local_data_source.dart';
import 'package:weather_app/layers/data/sources/remote/remote_data_source.dart';
import 'package:weather_app/layers/domain/models/search_city/city.dart';
import 'package:weather_app/layers/domain/repository/search_user_repository.dart';

class SearchCityRepositoryImpl implements SearchCityRepository {
  final RemoteDataSource remoteDataSource;
  final SearchCityLocalDataSource searchCityLocalDataSource;

  const SearchCityRepositoryImpl({
    required this.remoteDataSource,
    required this.searchCityLocalDataSource,
  });

  @override
  Future<List<City>> searchCityByName(String search) async {
    List<CityApi> cityApiList = await remoteDataSource.searchCityByName(search);
    searchCityLocalDataSource.saveListInMemory(cityApiList);
    return cityApiList.toCityList();
  }

  @override
  Future<void> savePickedCityCoordinates(int index) async =>
      searchCityLocalDataSource.saveCoordinatesToSettings(index);
}

extension Maper on List<CityApi> {
  List<City> toCityList() => map((e) => e.toCity()).toList();
}
