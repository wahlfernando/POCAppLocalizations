import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import '../model/poi.dart';
import '../service/location_service.dart';
import '../service/poi_database_service.dart';

class POIController extends GetxController {
  final LocationService _locationService = LocationService();
  final POIDatabaseService _databaseService = POIDatabaseService();

  var currentLocation = Rxn<Position>();
  var pois = <POI>[].obs;

  @override
  void onInit() {
    super.onInit();
    _getCurrentLocation();
    _loadPOIs();
  }

  void _getCurrentLocation() async {
    try {
      Position position = await _locationService.getCurrentLocation();
      currentLocation.value = position;
    } catch (e) {
      Get.snackbar(
        'Erro de Localização',
        'Não foi possível obter a localização: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        borderRadius: 8.0,
        margin: const EdgeInsets.all(16.0),
      );
    }
  }

  void addPOI(POI poi) async {
    pois.add(poi);
    await _databaseService.insertPOI(poi);
  }

  void _loadPOIs() async {
    List<POI> poiList = await _databaseService.getPOIs();
    pois.addAll(poiList);
  }
}
