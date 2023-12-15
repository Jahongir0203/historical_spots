import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<SplashEvent>((event, emit) async {
      emit(SplashInitialState());
      await Future.delayed(const Duration(seconds: 4), () {
        emit(SplashCompleteState());
      });
    });
  }
}
