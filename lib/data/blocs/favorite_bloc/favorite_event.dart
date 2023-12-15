part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}
class FavoriteLoadedEvent extends FavoriteEvent{}
class FavoriteStopededEvent extends FavoriteEvent{}

