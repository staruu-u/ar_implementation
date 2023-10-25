// ignore_for_file: constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'simple_screen.dart';

const double PIN1_VISIBLE_POSITION = 200;
const double PIN1_INVISIBLE_POSITION = -300;
const double PIN_VISIBLE_POSITION = 20;
const double PIN_INVISIBLE_POSITION = -220;
const bool POLY_VISIBLE = true;
const bool POLY_INVISIBLE = false;

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  late GoogleMapController mapController;
  Location location = Location();

  double pinPillPosition = PIN_INVISIBLE_POSITION;
  double pin1PillPosition = PIN1_VISIBLE_POSITION;
  bool polyVisibility = POLY_INVISIBLE;

  static const LatLng sourceLocation = LatLng(41.7567342, -88.31288719999999);
  static const LatLng destination = LatLng(41.757000, -88.312020);

  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      dotenv.get('API_KEY', fallback: "API_KEY not found"),
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getPolyPoints();
  }

  _onMapCreated(GoogleMapController controller) {
    setState(
      () {
        mapController = controller;
      },
    );
  }

  // ignore: unused_element
  _animateToUser() async {
    var pos = await location.getLocation();
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(pos.latitude!, pos.longitude!),
          zoom: 19,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(41.7567342,
                    -88.31288719999999), // Set the initial map position
                zoom: 19, // Set the initial zoom level
              ),
              mapType: MapType.satellite,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              onTap: (LatLng loc) {
                setState(() {
                  pinPillPosition = PIN_INVISIBLE_POSITION;
                  pin1PillPosition = PIN1_INVISIBLE_POSITION;
                  polyVisibility = POLY_VISIBLE;
                });
              },
              polylines: {
                Polyline(
                  polylineId: const PolylineId("route"),
                  points: polylineCoordinates,
                  color: Colors.lightBlue,
                  width: 6,
                  visible: polyVisibility,
                ),
              },
              markers: {
                Marker(
                  markerId: const MarkerId("mural1"),
                  position:
                      const LatLng(41.756755086583595, -88.31274603783288),
                  draggable: false,
                  onTap: () {
                    setState(
                      () {
                        pinPillPosition = PIN_VISIBLE_POSITION;
                      },
                    );
                  },
                ),
                const Marker(
                  markerId: MarkerId("mural2"),
                  position: LatLng(41.757000, -88.312020),
                  draggable: false,
                  visible: false,
                ),
              },
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            top: pin1PillPosition,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset.zero),
                ],
              ),
              child: Column(
                children: const [
                  Text(
                      "You are within the radius of a new mural. Click anywhere to view the directions!",
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            left: 0,
            right: 0,
            bottom: pinPillPosition,
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset.zero),
                ],
              ),
              child: Column(
                children: const [
                  Text(
                      "You found a new mural. Go to your camera in the app to scan it!",
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
