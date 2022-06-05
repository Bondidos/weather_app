import 'package:weather_app/layers/data/models/remote/current_weather/current_weather_api.dart';
import 'package:weather_app/layers/data/remote/api_client/api_client.dart';
import 'package:weather_app/layers/data/sources/remote_data_source.dart';

import 'api_query_generator/api_query_generator.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiQueryGenerator apiQueryGenerator;
  final ApiClient apiClient;

  RemoteDataSourceImpl({
    required this.apiQueryGenerator,
    required this.apiClient,
  });

  @override
  Future<CurrentWeatherApi> fetchCurrentWeather() async {
    return apiClient.fetchCurrentWeatherInLocation(
      await apiQueryGenerator.generateCurrentWeatherQuery(),
    );
  }
}