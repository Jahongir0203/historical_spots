part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}
class FavoriteLoadState extends FavoriteState {
  final int num;
  FavoriteLoadState(this.num);
}
class FavoriteFailState extends FavoriteState {
  final int num;
  FavoriteFailState(this.num);
}
