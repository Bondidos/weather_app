import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/layers/data/remote/api_client/api_client.dart';
import 'package:weather_app/layers/data/repository/weather_repository_impl.dart';

import 'layers/data/local/l18n_settings.dart';
import 'layers/data/location/location_data_source_impl.dart';
import 'layers/data/remote/api_query_generator/api_query_generator.dart';
import 'layers/data/remote/remote_data_source_impl.dart';
import 'layers/data/sources/l18n_settings.dart';
import 'layers/data/sources/location_data_source.dart';
import 'layers/data/sources/remote_data_source.dart';
import 'layers/domain/repository/weather_repository.dart';
import 'layers/domain/use_case/fetch_current_weather_use_case.dart';
import 'layers/domain/use_case/fetch_hourly_weather_forecast_use_case.dart';
import 'layers/presentation/main_page/bloc/main_page_cubit.dart';

final inj = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  //todo think about permissions (is this good place?)
  await Geolocator.requestPermission();

  inj.registerFactory<MainPageCubit>(() => MainPageCubit(
        fetchCurrentWeatherUseCase: inj(),
    fetchHourlyWeatherForecastUseCase: inj(),
      ));

  inj.registerFactory<FetchCurrentWeatherUseCase>(
      () => FetchCurrentWeatherUseCase(
            weatherRepository: inj(),
          ));

  inj.registerFactory<FetchHourlyWeatherForecastUseCase>(
          () => FetchHourlyWeatherForecastUseCase(
        weatherRepository: inj(),
      ));

  inj.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(
        remoteDataSource: inj(),
      ));

  inj.registerFactory<RemoteDataSource>(() => RemoteDataSourceImpl(
        apiQueryGenerator: inj(),
        apiClient: inj(),
      ));

  inj.registerLazySingleton<ApiClient>(() => ApiClient(inj()));

  inj.registerFactory<ApiQueryGenerator>(() => ApiQueryGenerator(
        locationDataSource: inj(),
        localisationSettings: inj(),
      ));

  inj.registerFactory<LocationDataSource>(() => LocationDataSourceImpl());

  inj.registerFactory<LocalisationSettings>(
    () => LocalisationSettingsImpl(
      sharedPreferences: inj(),
    ),
  );

  inj.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  final Dio dio = Dio()..interceptors.add(LogInterceptor());
  inj.registerFactory(() => dio);
}
