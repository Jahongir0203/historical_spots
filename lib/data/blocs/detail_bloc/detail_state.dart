part of 'detail_bloc.dart';

@immutable
abstract class DetailState {}

class DetailInitial extends DetailState {}

class DetailLoadInProgressState extends DetailState {}

class DetailLoadFailureState extends DetailState {}

class DetailLoadSuccessState extends DetailState {
  final PlacesDetailModel placesDetailModel;

  DetailLoadSuccessState(this.placesDetailModel);
}
