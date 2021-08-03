import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  bool locationServicesEnabled;

  Future<void> getLocation() async {
    try {
//      Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;
      Geolocator geolocator = Geolocator();
//      geolocator.forceAndroidLocationManager = true;
      locationServicesEnabled = await geolocator.isLocationServiceEnabled();
//      print('Location Services Enabled: $locationServicesEnabled');
      if (locationServicesEnabled) {
        Position position = await geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        latitude = position.latitude;
        longitude = position.longitude;
//        print('Lat: $latitude');
//        print('Lon: $longitude');
      } else {
        latitude = 360;
        longitude = 360;
      }
    } catch (e) {
      print(e);
    }
  }
}
