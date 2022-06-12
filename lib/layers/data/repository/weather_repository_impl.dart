import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/layers/data/models/remote/current_weather/current_weather_api.dart';
import 'package:weather_app/layers/data/models/remote/weather_forecast_api/hourly/weather_forecast_api.dart';
import 'package:weather_app/layers/data/repository/extensions/weather_repo_ext.dart';
import 'package:weather_app/layers/data/sources/local/settings/l18n_settings.dart';
import 'package:weather_app/layers/data/sources/local/weather_local_data_source.dart';
import 'package:weather_app/layers/data/sources/remote/remote_data_source.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/domain/models/weather_current_with_forecast/weather_current_with_forecast.dart';
import 'package:weather_app/layers/domain/repository/weather_repository.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final RemoteDataSource remoteDataSource;
  final WeatherLocalDataSource weatherLocalDataSource;
  final LocalisationSettings localisationSettings;

  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.weatherLocalDataSource,
    required this.localisationSettings,
  });

  Future<bool> _isConnectedToInternet() async =>
      SimpleConnectionChecker.isConnectedToInternet();

  @override
  Future<WeatherCurrentWithForecast> fetchWeatherFromApiOrLoadCache() async {
    return await _isConnectedToInternet()
        ? _weatherCurrentWithForecastFromApi()
        : _weatherCurrentWithForecastFromLocal();
  }

  Future<WeatherCurrentWithForecast>
      _weatherCurrentWithForecastFromApi() async {
    WeatherCurrentWithForecast weatherCurrentWithForecast =
        await _createWeatherCurrentWithForecast();
    _saveWeatherCurrentWithForecast(weatherCurrentWithForecast);
    return weatherCurrentWithForecast;
  }

  Future<WeatherCurrentWithForecast> _createWeatherCurrentWithForecast() async {
    CurrentWeather currentWeather = await _fetchCurrentWeather();
    WeatherForecastApi weatherForecastApi = await _fetchWeatherForecast();

    return WeatherCurrentWithForecast(
      currentWeather: currentWeather,
      dailyForecast: weatherForecastApi.daily.toDailyForecastList(),
      hourlyForecast:
          weatherForecastApi.hourly.toHourlyForecastList().pickFirstSixHours(),
    );
  }

  Future<CurrentWeather> _fetchCurrentWeather() async {
    CurrentWeatherApi currentWeatherApi = await _fetchCurrentWeatherFromApi();
    return currentWeatherApi.toCurrentWeather();
  }

  Future<CurrentWeatherApi> _fetchCurrentWeatherFromApi() async {
    try {
      return remoteDataSource.fetchCurrentWeather();
    } catch (e) {
      throw Exception(S.current.CheckConnection);
    }
  }

  Future<WeatherForecastApi> _fetchWeatherForecast() {
    try {
      return remoteDataSource.fetchWeatherForecast();
    } catch (e) {
      throw Exception(S.current.CheckConnection);
    }
  }

  void _saveWeatherCurrentWithForecast(
          WeatherCurrentWithForecast weatherCurrentWithForecast) =>
      weatherLocalDataSource
          .saveCurrentWithForecast(weatherCurrentWithForecast);

  Future<WeatherCurrentWithForecast>
      _weatherCurrentWithForecastFromLocal() async {
    final WeatherCurrentWithForecast weatherCurrentWithForecast;
    try {
      weatherCurrentWithForecast =
          await weatherLocalDataSource.fetchActualDataFromLocal();
    } catch (e) {
      throw Exception(S.current.NoCachedWeather);
    }
    return weatherCurrentWithForecast;
  }

  @override
  Future<CurrentWeather> fetchCurrentWeatherForCity() async {
    CurrentWeatherApi currentWeatherApi = await _fetchCurrentWeatherForCity();
    return currentWeatherApi.toCurrentWeather();
  }

  Future<CurrentWeatherApi> _fetchCurrentWeatherForCity() async {
    final CurrentWeatherApi currentWeatherApi;
    try {
      currentWeatherApi = await remoteDataSource.fetchCurrentWeatherForCity();
    } catch (e) {
      throw Exception(S.current.CheckConnection);
    }
    return currentWeatherApi;
  }

  @override
  Stream<String> subscribeLanguageChanged() =>
      localisationSettings.subscribeLanguageChanged();
}
