import 'package:weather_app/layers/data/models/remote/current_weather/current_weather_api.dart';
import 'package:weather_app/layers/data/models/remote/weather_forecast_api/hourly/weather_forecast_api.dart';
import 'package:weather_app/layers/data/repository/extensions.dart';
import 'package:weather_app/layers/data/sources/local/weather_local_data_source.dart';
import 'package:weather_app/layers/data/sources/remote/remote_data_source.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/domain/models/weather_current_with_forecast/weather_cuurent_with_forecast.dart';
import 'package:weather_app/layers/domain/models/weather_forecast/daily_forecast.dart';
import 'package:weather_app/layers/domain/models/weather_forecast/hourly_forecast.dart';
import 'package:weather_app/layers/domain/repository/weather_repository.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final RemoteDataSource remoteDataSource;
  final WeatherLocalDataSource weatherLocalDataSource;

  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.weatherLocalDataSource,
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
    CurrentWeatherApi currentWeatherApi =
        await remoteDataSource.fetchCurrentWeather();
    WeatherForecastApi forecast = await remoteDataSource.fetchWeatherForecast();
    return _createWeatherCurrentWithForecast(currentWeatherApi, forecast);
  }

  Future<WeatherCurrentWithForecast>
      _weatherCurrentWithForecastFromLocal() async =>
          weatherLocalDataSource.fetchActualDataFromLocal();

  WeatherCurrentWithForecast _createWeatherCurrentWithForecast(
    CurrentWeatherApi currentWeatherApi,
    WeatherForecastApi forecast,
  ) {
    CurrentWeather currentWeather =
        _mapCurrentWeatherApiAndSave(currentWeatherApi);
    List<DailyForecast> dailyForecastList = _mapDailyForecastAndSave(forecast);
    List<HourlyForecast> hourlyForecast = _mapHourlyForecastAndSave(forecast);

    return WeatherCurrentWithForecast(
      currentWeather: currentWeather,
      dailyForecast: dailyForecastList,
      hourlyForecast: hourlyForecast.pickFirstSixHours(),
    );
  }

  List<HourlyForecast> _mapHourlyForecastAndSave(WeatherForecastApi forecast)  {
    List<HourlyForecast> hourlyForecast =
        forecast.hourly.toHourlyForecastList();
     weatherLocalDataSource.saveHourlyForecast(hourlyForecast); // todo wait?

    return hourlyForecast;
  }

  List<DailyForecast> _mapDailyForecastAndSave(WeatherForecastApi forecast) {
    List<DailyForecast> dailyForecastList =
        forecast.daily.toDailyForecastList();
    weatherLocalDataSource.saveDailyForeCast(dailyForecastList); // todo wait?

    return dailyForecastList;
  }

  CurrentWeather _mapCurrentWeatherApiAndSave(
      CurrentWeatherApi currentWeatherApi) {
    CurrentWeather currentWeather = currentWeatherApi.toCurrentWeather();
    weatherLocalDataSource.saveCurrentWeather(currentWeather); // todo wait?
    return currentWeather;
  }

  @override
  Future<CurrentWeather> fetchCurrentWeatherForCity() async {
    CurrentWeatherApi currentWeatherApi =
        await remoteDataSource.fetchCurrentWeatherForCity();
    return currentWeatherApi.toCurrentWeather();
  }
}
