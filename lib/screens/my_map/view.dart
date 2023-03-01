import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:online_course/core/helper_methods.dart';
import 'package:online_course/screens/books/view.dart';
import 'dart:ui' as ui;

class MyMapView extends StatefulWidget {
  const MyMapView({Key? key}) : super(key: key);

  @override
  State<MyMapView> createState() => _MyMapViewState();
}

class _MyMapViewState extends State<MyMapView> {
  final completer = Completer<GoogleMapController>();

  static const CameraPosition cairo = CameraPosition(
    target: LatLng(29.2050735, 31.0041669),
    zoom: 10,
  );

  static const CameraPosition anotherPosition =
      CameraPosition(target: LatLng(29.150018, 35.4087333), zoom: 10);
  BitmapDescriptor? customIcon;

  @override
  void initState() {
    super.initState();
    getMarker();
  }

  getMarker() async {
    Uint8List markerIcon = await getBytesFromAsset('assets/images/app_logo.png', 100);
    customIcon = BitmapDescriptor.fromBytes(markerIcon);
  }

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
          initialCameraPosition: cairo,
          markers: markers,
          onTap: (argument) {
            print(argument.latitude);
            print(argument.longitude);
            markers.add(Marker(
                markerId: MarkerId(argument.longitude.toString()),
                position: LatLng(argument.latitude, argument.longitude),
                infoWindow: InfoWindow(title: "Marker2", snippet: "Hello From Marker 2")));
            setState(() {});
          },
          onMapCreated: (GoogleMapController controller) {
            completer.complete(controller);
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            final controller = await completer.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(anotherPosition));
          },
          label: const Text('Go To Another Position'),
          icon: const Icon(Icons.directions_boat),
        ));
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
}
