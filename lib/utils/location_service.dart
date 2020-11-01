import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  LocationPermission _permissionStatus;

  bool get getPermStatus {
    return LocationPermission.always == _permissionStatus ? true : false;
  }

  requestLocationPerm() async {
    _permissionStatus = await Geolocator.requestPermission();
  }

  Future<List<double>> getLatLon() async {
    Position position = await Geolocator.getLastKnownPosition();

    return [position.latitude, position.longitude];
  }

  Future<List<String>> getStateDist() async {
    final data = await getLatLon();
    Placemark placemarks =
        (await placemarkFromCoordinates(data[0], data[1])).first;
    return [placemarks.administrativeArea, placemarks.locality];
  }
}
