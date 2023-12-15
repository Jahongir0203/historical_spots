import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:retrofit/retrofit.dart';

import '../models/detail_places_page.dart';
import '../models/list_places_model.dart';

part 'network_service.g.dart';

@RestApi(baseUrl: 'http://api.opentripmap.com/0.1/en/places/')
abstract class NetworkService {


  factory NetworkService(Dio dio, {String baseUrl}) = _NetworkService;

  @GET('/bbox')
  Future<List<PlacesListModel>?> getPlaces(
    @Query("lon_min") double lonMin,
    @Query("lon_max") double lonMax,
    @Query("lat_min") double latMin,
    @Query("lat_max") double latMax,
    @Query("format") String format,
    @Query("apikey") String apikey,
  );

  @GET('/xid/{id}')
  Future<PlacesDetailModel?> getPlaceDetail(
    @Path() String id,
    @Query("apikey") String apikey,
  );
}
