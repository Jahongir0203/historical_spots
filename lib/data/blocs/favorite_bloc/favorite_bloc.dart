import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<FavoriteLoadedEvent>((event, emit) {
      emit(FavoriteLoadState(1));
    });
    on<FavoriteStopededEvent>((event, emit) {
      emit(FavoriteFailState(2));
    });

  }
}
