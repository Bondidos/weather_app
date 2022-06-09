import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/layers/data/local/search_city_local_data_source_impl.dart';
import 'package:weather_app/layers/data/local/settings/search_city_settings_impl.dart';
import 'package:weather_app/layers/data/remote/api_client/api_client.dart';
import 'package:weather_app/layers/data/repository/weather_repository_impl.dart';
import 'package:weather_app/layers/domain/use_case/fetch_weather_for_city_use_case.dart';
import 'layers/data/local/settings/l18n_settings.dart';
import 'layers/data/location/location_data_source_impl.dart';
import 'layers/data/remote/api_query_generator/api_query_generator.dart';
import 'layers/data/remote/remote_data_source_impl.dart';
import 'layers/data/repository/search_city_repository_impl.dart';
import 'layers/data/sources/local/search_city_local_data_source.dart';
import 'layers/data/sources/local/settings/l18n_settings.dart';
import 'layers/data/sources/local/settings/search_city_settings.dart';
import 'layers/data/sources/location/location_data_source.dart';
import 'layers/data/sources/remote/remote_data_source.dart';
import 'layers/domain/repository/search_user_repository.dart';
import 'layers/domain/repository/weather_repository.dart';
import 'layers/domain/use_case/fetch_weather_from_api_or_cache_use_case.dart';
import 'layers/domain/use_case/save_picked_city_coordinates_use_case.dart';
import 'layers/domain/use_case/search_city_by_name_use_case.dart';
import 'layers/presentation/city_page/bloc/city_weather_cubit.dart';
import 'layers/presentation/main_page/bloc/main_page_cubit.dart';
import 'layers/presentation/search_page/bloc/search_city_cubit.dart';

final inj = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  //todo think about permissions (is this good place?)
  await Geolocator.requestPermission();

  inj.registerFactory<CityWeatherCubit>(() => CityWeatherCubit(
        fetchWeatherForCityUseCase: inj(),
      ));

  inj.registerFactory<SearchCityCubit>(() => SearchCityCubit(
        searchCityByName: inj(),
        savePickedCityCoordinates: inj(),
      ));

  inj.registerFactory<MainPageCubit>(() => MainPageCubit(
        fetchWeatherFromApiOrCacheUseCase: inj(),
      ));

  inj.registerFactory<FetchWeatherForCityUseCase>(
          () => FetchWeatherForCityUseCase(
        weatherRepository: inj(),
      ));

  inj.registerFactory<FetchWeatherFromApiOrCacheUseCase>(
      () => FetchWeatherFromApiOrCacheUseCase(
            weatherRepository: inj(),
          ));

  inj.registerFactory<SavePickedCityCoordinatesUseCase>(
      () => SavePickedCityCoordinatesUseCase(
            searchCityRepository: inj(),
          ));
  inj.registerFactory<SearchCityByNameUseCase>(() => SearchCityByNameUseCase(
        searchCityRepository: inj(),
      ));

  inj.registerLazySingleton<SearchCityRepository>(
      () => SearchCityRepositoryImpl(
            remoteDataSource: inj(),
            searchCityLocalDataSource: inj(),
          ));

  inj.registerLazySingleton<SearchCityLocalDataSource>(
      () => SearchCityLocalDataSourceImpl(
            searchCitySettings: inj(),
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
        searchCitySettings: inj(),
      ));

  inj.registerFactory<LocationDataSource>(() => LocationDataSourceImpl());

  inj.registerFactory<LocalisationSettings>(
    () => LocalisationSettingsImpl(
      sharedPreferences: inj(),
    ),
  );

  inj.registerFactory<SearchCitySettings>(
    () => SearchCitySettingsImpl(
      sharedPreferences: inj(),
    ),
  );

  inj.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  final Dio dio = Dio()..interceptors.add(LogInterceptor());
  inj.registerFactory(() => dio);
}
