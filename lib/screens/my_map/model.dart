import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchData {
  late List<Result> results;

  SearchData.froJson(Map<String, dynamic> json) {
    results = List.from(json['features'] ?? []).map((e) => Result.fromJson(e)).toList();
  }
}

class Result {
  late num lat, lng;
  late String name, label;

  Result.fromJson(Map<String, dynamic> json) {
    lat = json["geometry"]['coordinates'][1];
    lng = json["geometry"]['coordinates'][0];
    name = json["properties"]['name'];
    label = json["properties"]['label'];
  }
}

class DrawLineData {
  List<LatLng> listOfPoints = [];

  DrawLineData.froJson(Map<String, dynamic> json) {
    final list = json["features"][0]["geometry"]['coordinates'] as List;
    print(list.length);

    list.forEach((element) {
      listOfPoints.add(LatLng(element[1], element[0]));
    });
  }
}
