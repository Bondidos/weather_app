import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/domain/use_case/fetch_weather_for_city_use_case.dart';
import 'package:weather_app/layers/domain/use_case/subscribe_language_changed_use_case.dart';

import 'city_weather_state.dart';

class CityWeatherCubit extends Cubit<CityWeatherState> {
  final FetchWeatherForCityUseCase fetchWeatherForCityUseCase;
  final SubscribeLanguageChangedUseCase subscribeLanguageChangedUseCase;
  StreamSubscription? _languageChanged;

  CityWeatherCubit({
    required this.fetchWeatherForCityUseCase,
    required this.subscribeLanguageChangedUseCase,
  }) : super(const CityWeatherState(
          currentWeather: null,
          status: CityWeatherStatus.initial,
        )){
    _subscribe();
  }

  _subscribe() {
    _languageChanged =
        subscribeLanguageChangedUseCase.execute().listen((event) {
          fetchCurrentWeather();
        });
  }

  Future<void> fetchCurrentWeather() async {
    emit(state.copyWith(status: CityWeatherStatus.loading));
    try {
      await _fetchWeather();
    } catch (e) {
      _error(e);
    }
  }

  Future<void> _fetchWeather() async {
    final CurrentWeather currentWeather =
        await fetchWeatherForCityUseCase.execute();
    emit(state.copyWith(
        currentWeather: currentWeather, status: CityWeatherStatus.loaded));
  }

  void _error(Object e) {
    emit(
      CityWeatherError(
        message: e.toString(),
        status: CityWeatherStatus.error,
      ),
    );
  }

  @override
  Future<void> close() {
    _languageChanged?.cancel();
    return super.close();
  }
}
