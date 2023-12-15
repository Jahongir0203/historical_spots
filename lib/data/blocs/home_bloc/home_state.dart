part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadInProgressState extends HomeState {}

class HomeLoadSuccessState extends HomeState {
  final List<PlacesListModel?> places;

  HomeLoadSuccessState(this.places);
}

class HomeLoadFailureState extends HomeState {}
