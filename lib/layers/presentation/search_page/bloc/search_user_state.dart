import 'package:equatable/equatable.dart';
import 'package:weather_app/layers/domain/models/search_city/city.dart';

enum SearchStatus { initial, loading, loaded }

class SearchCityState extends Equatable {
  final List<City> foundList;
  final SearchStatus status;

  const SearchCityState({
    required this.foundList,
    required this.status,
  });

  @override
  List<Object?> get props => [foundList, status];

  SearchCityState copyWith({List<City>? foundList, SearchStatus? status}) {
    return SearchCityState(
      foundList: foundList ?? this.foundList,
      status: status ?? this.status,
    );
  }
}

class SearchError extends SearchCityState {
  const SearchError({
    required List<City> foundList,
    required SearchStatus status,
    required this.message,
  }) : super(foundList: foundList, status: status);
  final String message;
}
