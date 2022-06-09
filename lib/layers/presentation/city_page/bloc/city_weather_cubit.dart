import 'package:bloc/bloc.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/domain/use_case/fetch_weather_for_city_use_case.dart';

import 'city_weather_state.dart';

class CityWeatherCubit extends Cubit<CityWeatherState> {
  final FetchWeatherForCityUseCase fetchWeatherForCityUseCase;

  CityWeatherCubit({
    required this.fetchWeatherForCityUseCase,
  }) : super(const CityWeatherState(
          currentWeather: null,
          status: CityWeatherStatus.initial,
        ));

  Future<void> fetchCurrentWeather() async {
    try {
      await fetchWeather();
    } catch (e) {
      error(e);
    }
  }

  Future<void> fetchWeather() async {
    final CurrentWeather currentWeather =
        await fetchWeatherForCityUseCase.execute();
    emit(state.copyWith(
        currentWeather: currentWeather, status: CityWeatherStatus.loaded));
  }

  void error(Object e) {
    emit(
      CityWeatherError(
        message: e.toString(),
        status: CityWeatherStatus.loaded,
        currentWeather: null,
      ),
    );
  }
}
