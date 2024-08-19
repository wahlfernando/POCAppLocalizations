import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'add_poi_dialog.dart';
import '../view_model/poi_view_model.dart';

class HomePage extends StatelessWidget {
  final POIViewModel viewModel = Get.put(POIViewModel());

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POI Locator'),
      ),
      body: Obx(() {
        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(viewModel.currentLocation.value.latitude,
                viewModel.currentLocation.value.longitude),
            zoom: 14.0,
          ),
          markers: Set<Marker>.of(viewModel.pois.map((poi) {
            return Marker(
              markerId: MarkerId(poi.id),
              position: LatLng(poi.latitude, poi.longitude),
              infoWindow:
                  InfoWindow(title: poi.title, snippet: poi.description),
            );
          })),
          onTap: (LatLng position) {
            showDialog(
              context: context,
              builder: (context) => AddPOIDialog(position: position),
            );
          },
        );
      }),
    );
  }
}
