import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weather_app/layers/domain/models/search_city/city.dart';
import 'package:weather_app/layers/domain/use_case/save_picked_city_coordinates_use_case.dart';
import 'package:weather_app/layers/domain/use_case/search_city_by_name_use_case.dart';
import 'package:weather_app/layers/presentation/search_page/bloc/search_user_state.dart';

class SearchCityCubit extends Cubit<SearchCityState> {
  final SearchCityByNameUseCase searchCityByName;
  final SavePickedCityCoordinatesUseCase savePickedCityCoordinates;
  final PublishSubject<String> _searchStream = PublishSubject<String>();

  SearchCityCubit({
    required this.searchCityByName,
    required this.savePickedCityCoordinates,
  }) : super(const SearchCityState(
          foundList: [],
          status: SearchStatus.initial,
        ));

  void init() {
    _searchStream
        .debounce((event) => TimerStream(true, const Duration(seconds: 1)))
        .listen((search) async {
      try {
        await fetchListOfCities(search);
      } catch (e) {
        error(e);
      }
    });
  }

  void error(Object e) {
    emit(
      SearchError(
        message: e.toString(),
        status: SearchStatus.loaded,
        foundList: List.empty(),
      ),
    );
  }

  Future<void> fetchListOfCities(String search) async {
    final List<City> result = await searchCityByName.execute(search);
    emit(state.copyWith(
      foundList: result,
      status: SearchStatus.loaded,
    ));
  }

  void onTextChange(String search) => _searchStream.add(search);

  Future<void> cityPicked(int index) =>
      savePickedCityCoordinates.execute(index);

  @override
  Future<void> close() {
    _searchStream.close();
    return super.close();
  }
}
