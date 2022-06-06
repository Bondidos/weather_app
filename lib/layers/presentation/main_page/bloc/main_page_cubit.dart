import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/domain/use_case/fetch_current_weather_use_case.dart';
import 'package:weather_app/layers/presentation/main_page/bloc/main_page_state.dart';
import 'package:bloc/bloc.dart';

class MainPageCubit extends Cubit<MainPageState> {
  final FetchCurrentWeatherUseCase fetchCurrentWeatherUseCase;

  MainPageCubit({
    required this.fetchCurrentWeatherUseCase,
  }) : super(
          const MainPageState(
            currentWeather: null,
            status: MainPageStatus.initial,
          ),
        );

  Future<void> fetchCurrentWeather() async {
    emit(_loadingState());
    final CurrentWeather currentWeather;
    try {
      currentWeather = await fetchCurrentWeatherUseCase.execute();
    } catch (e) {
      emit(_errorState(e.toString()));
      return;
    }
    emit(_loadedState(currentWeather));
  }

  MainPageState _loadingState() =>
      state.copyWith(currentWeather: null, status: MainPageStatus.loading);

  MainPageState _errorState(String message) => MainPageError(
        currentWeather: null,
        status: MainPageStatus.error,
        message: message,
      );
  MainPageState _loadedState(CurrentWeather currentWeather) =>
      state.copyWith(
          currentWeather: currentWeather, status: MainPageStatus.loaded);
}
