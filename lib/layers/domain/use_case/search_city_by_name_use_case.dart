import 'package:weather_app/layers/domain/models/search_city/city.dart';
import 'package:weather_app/layers/domain/repository/search_user_repository.dart';

class SearchCityByNameUseCase {
  final SearchCityRepository searchCityRepository;

  const SearchCityByNameUseCase({
    required this.searchCityRepository,
  });

  Future<List<City>> execute(String search) =>
      searchCityRepository.searchCityByName(search);
}
