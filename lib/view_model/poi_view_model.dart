import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:poc_app_localizations/service/location_service.dart';

import '../model/poi.dart';
import '../service/poi_database_service.dart';

class POIViewModel extends GetxController {
  final LocationService _locationService = LocationService();
  final POIDatabaseService _databaseService = POIDatabaseService();

  var currentLocation = Position(
          latitude: 0.0,
          longitude: 0.0,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          altitudeAccuracy: 0,
          heading: 0,
          headingAccuracy: 0,
          speed: 0,
          speedAccuracy: 0,
          floor: 1,
          isMocked: true)
      .obs;
  var pois = <POI>[].obs;

  @override
  void onInit() {
    super.onInit();
    _getCurrentLocation();
    _loadPOIs();
  }

  void _getCurrentLocation() async {
    Position position = await _locationService.getCurrentLocation();
    currentLocation.value = position;
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
