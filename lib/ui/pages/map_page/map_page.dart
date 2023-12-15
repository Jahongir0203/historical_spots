import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/models/detail_places_page.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key, required this.point, required this.title});

  final Point point;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(point.lat!, point.lon!),
              zoom: 18,
            ),
            markers: Set.of({
              Marker(
                markerId: MarkerId(""),
                position: LatLng(
                  point.lat!,
                  point.lon!,
                ),
                infoWindow: InfoWindow(title: '$title', snippet: 'Location'),
                onTap: () {},
              )
            }),
            onMapCreated: (GoogleMapController controller) {
              // _controller.complete(controller);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0,top: 30,),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                   BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 8,
                      offset: Offset(1, 1),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon:const Icon(Icons.arrow_back_ios_new),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
