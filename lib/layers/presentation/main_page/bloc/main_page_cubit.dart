import 'dart:async';

import 'package:weather_app/layers/domain/use_case/fetch_weather_from_api_or_cache_use_case.dart';
import 'package:weather_app/layers/domain/use_case/subscribe_language_changed_use_case.dart';
import 'package:weather_app/layers/presentation/main_page/bloc/main_page_state.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_app/layers/domain/models/weather_current_with_forecast/weather_current_with_forecast.dart';

class MainPageCubit extends Cubit<MainPageState> {
  final FetchWeatherFromApiOrCacheUseCase fetchWeatherFromApiOrCacheUseCase;
  final SubscribeLanguageChangedUseCase subscribeLanguageChangedUseCase;
  StreamSubscription? _languageChanged;

  MainPageCubit({
    required this.fetchWeatherFromApiOrCacheUseCase,
    required this.subscribeLanguageChangedUseCase,
  }) : super(
          const MainPageState(
            weatherCurrentWithForecast: null,
            status: MainPageStatus.initial,
          ),
        ) {
    _subscribe();
  }

  _subscribe() {
    _languageChanged =
        subscribeLanguageChangedUseCase.execute().listen((event) {
      fetchWeather();
    });
  }

  Future<void> fetchWeather() async {
    emit(_loadingState());
    final WeatherCurrentWithForecast weatherCurrentWithForecast;
    try {
      weatherCurrentWithForecast =
          await fetchWeatherFromApiOrCacheUseCase.execute();
    } catch (e) {
      emit(_errorState(e.toString()));
      return;
    }
    emit(_loadedState(weatherCurrentWithForecast));
  }

  MainPageState _loadingState() =>
      state.copyWith(status: MainPageStatus.loading);

  MainPageState _errorState(String message) => MainPageError(
        weatherCurrentWithForecast: null,
        status: MainPageStatus.error,
        message: message,
      );

  MainPageState _loadedState(
    WeatherCurrentWithForecast weatherCurrentWithForecast,
  ) =>
      state.copyWith(
        weatherCurrentWithForecast: weatherCurrentWithForecast,
        status: MainPageStatus.loaded,
      );

  @override
  Future<void> close() {
    _languageChanged?.cancel();
    return super.close();
  }
}
