// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchallenges/modules/travel_app/country.dart';

class TravelAppCubit extends Cubit<TravelAppState> {
  TravelAppCubit() : super(const TravelAppState()) {
    init(countriesData);
  }
  bool enableChangeTopScrollPosition = true;

  void init(List<Country> countries) {
    emit(TravelAppState(countries: countries));
  }

  void changeCountry(int index) {
    emit(state.copy(selected: index));
  }

  void finishUpdateCountry() {
    enableChangeTopScrollPosition = true;
  }
}

class TravelAppState extends Equatable {
  const TravelAppState({
    this.countries = const <Country>[],
    this.selected = 0,
  });
  final List<Country> countries;
  final int selected;

  @override
  List<Object> get props => [countries, selected];

  TravelAppState copy({
    List<Country>? countries,
    int? selected,
  }) {
    return TravelAppState(
      countries: countries ?? this.countries,
      selected: selected ?? this.selected,
    );
  }
}
