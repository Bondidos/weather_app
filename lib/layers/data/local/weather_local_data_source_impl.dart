import 'package:weather_app/layers/data/local/drift_database/dao/dao.dart';
import 'package:weather_app/layers/data/sources/local/weather_local_data_source.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/domain/models/weather_current_with_forecast/weather_cuurent_with_forecast.dart';
import 'package:weather_app/layers/domain/models/weather_forecast/daily_forecast.dart';
import 'package:weather_app/layers/domain/models/weather_forecast/hourly_forecast.dart';

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  DailyForecastDao dailyForecastDao;
  HourlyForecastDao hourlyForecastDao;
  CurrentWeatherDao currentWeatherDao;

  WeatherLocalDataSourceImpl({
    required this.dailyForecastDao,
    required this.hourlyForecastDao,
    required this.currentWeatherDao,
  });

  @override
  Future<WeatherCurrentWithForecast> fetchActualDataFromLocal() async {
    List<DailyForecast> dailyForecastList =
        await dailyForecastDao.getDailyForecastAccordingWithDate(_currentTime);
    List<HourlyForecast> hourlyForecastList =
        await hourlyForecastDao.getActualSixHoursForecast(_currentTime);
    CurrentWeather currentWeather =
        await currentWeatherDao.getSavedCurrentWeather();
    return _createWeatherCurrentWithForecast(
      dailyForecastList,
      hourlyForecastList,
      currentWeather,
    );
  }

  @override
  Future<void> saveCurrentWeather(CurrentWeather currentWeather) =>
      currentWeatherDao.saveCurrentWeather(currentWeather);

  @override
  Future<void> saveDailyForeCast(List<DailyForecast> list) =>
      dailyForecastDao.saveDailyForeCast(list);

  @override
  Future<void> saveHourlyForecast(List<HourlyForecast> list) =>
      hourlyForecastDao.saveHourlyForecast(list);

  WeatherCurrentWithForecast _createWeatherCurrentWithForecast(
    List<DailyForecast> dailyForecastList,
    List<HourlyForecast> hourlyForecastList,
    CurrentWeather currentWeather,
  ) =>
      WeatherCurrentWithForecast(
        currentWeather: currentWeather,
        dailyForecast: dailyForecastList,
        hourlyForecast: hourlyForecastList,
      );

  int get _currentTime => DateTime.now().millisecondsSinceEpoch ~/ 1000;//todo write method
}
