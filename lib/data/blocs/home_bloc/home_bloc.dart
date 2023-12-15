import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:historical_spots/data/models/list_places_model.dart';
import 'package:historical_spots/data/services/position.dart';
import 'package:meta/meta.dart';

import '../../services/network_service.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final NetworkService networkService;
  final CurrentPosition currentPosition = CurrentPosition();

  HomeBloc(this.networkService) : super(HomeInitialState()) {
    on<HomeEvent>((event, emit) async {
      emit(HomeLoadInProgressState());
           Position position=await currentPosition.determinePosition();
      List<PlacesListModel>? places = await networkService.getPlaces(
          position.longitude-5,
          position.longitude+5,
          position.latitude-5,
          position.latitude+5,
          'json',
          '5ae2e3f221c38a28845f05b692af020e1bb9ec5f0c087c099fcaabd3');
      if (places != null) {
        emit(
          HomeLoadSuccessState(places),
        );
      } else {
        emit(HomeLoadFailureState());
      }
    });
  }
}
