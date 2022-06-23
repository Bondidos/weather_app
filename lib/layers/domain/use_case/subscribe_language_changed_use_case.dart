import 'package:weather_app/layers/domain/repository/weather_repository.dart';

class SubscribeLanguageChangedUseCase {
  final WeatherRepository weatherRepository;

  const SubscribeLanguageChangedUseCase({
    required this.weatherRepository,
  });

  Stream<String> execute() => weatherRepository.subscribeLanguageChanged();
}
