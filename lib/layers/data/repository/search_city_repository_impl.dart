import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/layers/data/models/remote/search_city/city_api.dart';
import 'package:weather_app/layers/data/repository/extensions/search_city_repo_ext.dart';
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
    List<CityApi> cityApiList = await _fetchCitiesList(search);
    searchCityLocalDataSource.saveListInMemory(cityApiList);
    return cityApiList.toCityList();
  }

  Future<List<CityApi>> _fetchCitiesList(String search) async {
    try {
      return remoteDataSource.searchCityByName(search);
    } catch (e) {
      throw Exception(S.current.CheckConnection);
    }
  }

  @override
  Future<void> savePickedCityCoordinates(int index) async =>
      searchCityLocalDataSource.saveCoordinatesToSettings(index);
}
