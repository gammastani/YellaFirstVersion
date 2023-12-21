import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yellafirstversion/components/menu_button.dart'; // Import MenuButton component
import 'package:yellafirstversion/components/app_drawer.dart'; // Import AppDrawer component
import 'package:yellafirstversion/components/custom_scaffold.dart';



class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? mapController;
  Position? currentPosition;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Add GlobalKey

  @override
  void initState() {
    super.initState();
    _determinePosition().then((position) {
      setState(() {
        currentPosition = position;
        if (mapController != null) {
          mapController!.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 11.0,
            ),
          ));
        }
      });
    });
  }
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Check and request permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Get and return the current position
    return await Geolocator.getCurrentPosition();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (currentPosition != null) {
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(currentPosition!.latitude, currentPosition!.longitude),
          zoom: 11.0,
        ),
      ));
    }
  }


  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Map',
      body: currentPosition == null
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Expanded(
            flex: 3,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(currentPosition!.latitude, currentPosition!.longitude),
                zoom: 11.0,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
              // Additional content
            ),
          ),
        ],
      ),
    );
  }
}