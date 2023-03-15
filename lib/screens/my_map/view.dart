import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:online_course/core/helper_methods.dart';
import 'package:online_course/screens/books/view.dart';
import 'dart:ui' as ui;

import 'model.dart';

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
  Set<Polyline> polylines = {};
  LatLng? start,end;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: cairo,
                markers: markers,
                polylines: polylines,
                onTap: (argument) async{
                  print(argument.latitude);
                  print(argument.longitude);
                  if(start==null)
                    {
                      start = argument;
                    }else
                      {
                        end = argument;
                        await drawLine();


                      }
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
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  onFieldSubmitted: (value) async {
                    print(value);
                    final resp = await Dio().get(
                        "https://api.openrouteservice.org/geocode/search?api_key=5b3ce3597851110001cf6248749713f10c544f8e90f93b62fd52679e&text=$value&size=50&boundary.country=eg");
                    final model = SearchData.froJson(resp.data);
                    // print(model.results[0].name);
                    // print(model.results[1].name);
                    // print(model.results[2].name);
                    showMenu(
                      context: context,
                      position: const RelativeRect.fromLTRB(16, 100, 16, 0),
                      constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width - 50,
                          maxWidth: MediaQuery.of(context).size.width - 50,
                          minHeight: 200,
                          maxHeight: 400),
                      items: List.generate(
                        model.results.length,
                        (index) => PopupMenuItem(
                          child: Text(model.results[index].name),
                          onTap: () {
                            goTo(model.results[index].lat.toDouble(),
                                model.results[index].lng.toDouble());
                          },
                        ),
                      ),
                    );
                  },
                  decoration: InputDecoration(filled: true, fillColor: Colors.white),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {

          },
          label: const Text('Go To Another Position'),
          icon: const Icon(Icons.directions_boat),
        ));
  }


  Future<void> drawLine()async{
    final resp = await Dio().get(
        "https://api.openrouteservice.org/v2/directions/driving-car?api_key=5b3ce3597851110001cf6248749713f10c544f8e90f93b62fd52679e&start=${start!.longitude},${start!.latitude}&end=${end!.longitude},${end!.latitude}");
    final model = DrawLineData.froJson(resp.data);
    model.listOfPoints.insert(0, start!);
    model.listOfPoints.add(end!);

    polylines.add(Polyline(polylineId: PolylineId("ds"),color: Colors.red,width: 3, points: model.listOfPoints));
    setState(() {

    });
  }

  void goTo(double lat, double lng) async {
    final controller = await completer.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 16),
      ),
    );
    markers.add(Marker(
        markerId: MarkerId(lat.toString()),
        position: LatLng(lat.toDouble(), lng.toDouble()),
        infoWindow: InfoWindow(title: "Marker2", snippet: "Hello From Marker 2")));
    setState(() {});
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
}
