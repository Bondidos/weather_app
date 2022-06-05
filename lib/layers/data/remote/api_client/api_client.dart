import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/layers/data/models/remote/current_weather/current_weather_api.dart';

part 'api_client.g.dart';

const baseUrl = "http://api.openweathermap.org";

@RestApi(baseUrl: baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/data/2.5/weather/")
  Future<CurrentWeatherApi> fetchCurrentWeatherInLocation(
    @Queries() Map<String, dynamic> query,
  );
}
