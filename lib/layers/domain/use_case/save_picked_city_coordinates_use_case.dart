import 'package:weather_app/layers/domain/repository/search_user_repository.dart';

class SavePickedCityCoordinatesUseCase {
  final SearchCityRepository searchCityRepository;

  const SavePickedCityCoordinatesUseCase({
    required this.searchCityRepository,
  });

  Future<void> execute(int index) =>
      searchCityRepository.savePickedCityCoordinates(index);
}