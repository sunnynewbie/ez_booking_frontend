import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LocationService {
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  Future<void> openGoogleMaps(double latitude, double longitude) async {
    final hasPermission = await _handleLocationPermission();
    
    if (!hasPermission) {
      print('Location permissions are denied');
      return;
    }

    final String googleMapsUrl = 
      'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude';

    try {
      if (await canLaunchUrlString(googleMapsUrl)) {
        await launchUrlString(
          googleMapsUrl,
          mode: LaunchMode.externalApplication,
        );
      } else {
        throw 'Could not launch Google Maps';
      }
    } catch (e) {
      print('Error launching maps: $e');
    }
  }
}

