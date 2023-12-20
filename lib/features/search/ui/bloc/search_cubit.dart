import 'package:first_bus/features/search/repository/search_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/search_repository.dart';

// Define the states for the SearchCubit
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Bus> results;

  SearchSuccess(this.results);
}

class SearchError extends SearchState {
  final String errorMessage;

  SearchError(this.errorMessage);
}

// Define the SearchCubit
class SearchCubit extends Cubit<SearchState> {
  SearchCubit({this.fromCity, this.toCity, this.date}) : super(SearchInitial());

  String? fromCity;
  String? toCity;
  String? date;

  final _searchRepository = SearchRepository();

  void setFromCity(String city) {
    fromCity = city;
  }

  void setToCity(String city) {
    toCity = city;
  }

  void setDate(String searchDate) {
    date = searchDate;
  }

  void search() async {
    emit(SearchLoading());

    try {
      if (fromCity == null || toCity == null || date == null) {
        throw Exception('Please enter all search parameters');
      }
      // Perform the search logic here
      List<Bus> results = await _performSearch(fromCity!, toCity!, date!);
      emit(SearchSuccess(results));
    } catch (e) {
      emit(SearchError('An error occurred while searching: $e'));
    }
  }

  Future<List<Bus>> _performSearch(
      String fromCity, String toCity, String date) async {
  final result = await _searchRepository.search(
      fromCityId: fromCity,
      toCityId: toCity,
      journeyDate: date,
      providerCode: 'TY',
    );

    return result;
  }
}
