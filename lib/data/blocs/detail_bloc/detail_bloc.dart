import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:historical_spots/data/services/network_service.dart';
import 'package:meta/meta.dart';

import '../../models/detail_places_page.dart';

part 'detail_event.dart';

part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final NetworkService networkService;

  DetailBloc(this.networkService) : super(DetailInitial()) {
    on<DetailLoadedEvent>((event, emit) async {
      emit(DetailLoadInProgressState());
      PlacesDetailModel? places = await networkService.getPlaceDetail(
        event.xid,
        "5ae2e3f221c38a28845f05b692af020e1bb9ec5f0c087c099fcaabd3",
      );
      if (places != null) {
        emit(DetailLoadSuccessState(places));
      } else {
        emit(DetailLoadFailureState());
      }
    });
  }
}
