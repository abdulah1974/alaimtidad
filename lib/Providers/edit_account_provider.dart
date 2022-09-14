import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class edit_account_provider extends ChangeNotifier{

 late String name="abdullah";
 late String email="abdulaah@gmail.com";
 late String nmber_mobile="07709431604";

 GoogleMapController? mapController;
 Set<Marker> markers = Set();
late double hueColor;

 LatLng carLocation = LatLng(36.250593, 44.066832);
 addMarkers() async {
  BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
   ImageConfiguration(),
   "assets/images/logo.png",

  );

  String imgurl = "https://www.fluttercampus.com/img/car.png";
  Uint8List bytes = (await NetworkAssetBundle(Uri.parse(imgurl))
      .load(imgurl))
      .buffer
      .asUint8List();

  double hueColor;

  hueColor = BitmapDescriptor.hueRed;


  markers.add(
   Marker( //add start location marker
    icon: BitmapDescriptor.defaultMarkerWithHue(hueColor),
    markerId: MarkerId(carLocation.toString()),
    position: carLocation, //position of marker
    infoWindow: InfoWindow(
     title: 'Car Point ',
     snippet: 'Car Marker',
    ),
 //   icon: BitmapDescriptor.fromBytes(bytes),
    //Icon for Marker
   ),
  );
  notifyListeners();

 }
}