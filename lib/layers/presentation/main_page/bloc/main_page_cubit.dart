import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/domain/models/hourly_weather_forecast/hourly_forecast.dart';
import 'package:weather_app/layers/domain/use_case/fetch_current_weather_use_case.dart';
import 'package:weather_app/layers/domain/use_case/fetch_hourly_weather_forecast_use_case.dart';
import 'package:weather_app/layers/presentation/main_page/bloc/main_page_state.dart';
import 'package:bloc/bloc.dart';

class MainPageCubit extends Cubit<MainPageState> {
  final FetchCurrentWeatherUseCase fetchCurrentWeatherUseCase;
  final FetchHourlyWeatherForecastUseCase fetchHourlyWeatherForecastUseCase;

  MainPageCubit({
    required this.fetchCurrentWeatherUseCase,
    required this.fetchHourlyWeatherForecastUseCase,
  }) : super(
          const MainPageState(
            currentWeather: null,
            hourlyForecast: [],
            status: MainPageStatus.initial,
          ),
        );

  Future<void> init() async {
    emit(_loadingState());
    final CurrentWeather currentWeather;
    final List<HourlyForecast> hourlyForecast;
    try {
        currentWeather = await fetchCurrentWeather();
        hourlyForecast = await fetchHourlyForecast();
    } catch (e) {
      emit(_errorState(e.toString()));
      return;
    }
    emit(_loadedState(currentWeather, hourlyForecast));
  }

  Future<CurrentWeather> fetchCurrentWeather() async =>
      fetchCurrentWeatherUseCase.execute();

  Future<List<HourlyForecast>> fetchHourlyForecast() async =>
      fetchHourlyWeatherForecastUseCase.execute();

  MainPageState _loadingState() =>
      state.copyWith(status: MainPageStatus.loading);

  MainPageState _errorState(String message) => MainPageError(
        currentWeather: null,
        status: MainPageStatus.error,
        hourlyForecast: state.hourlyForecast,
        message: message,
      );

  MainPageState _loadedState(
          CurrentWeather currentWeather, List<HourlyForecast> hourlyForecast) =>
      state.copyWith(
        currentWeather: currentWeather,
        status: MainPageStatus.loaded,
        hourlyForecast: hourlyForecast,
      );
}
