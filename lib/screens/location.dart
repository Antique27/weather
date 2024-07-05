import 'dart:html';
import 'package:flutter/material.dart';

import 'location_screen.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  late double longitude;
  late double latitude;
  Future <void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      longitude = position.longitude;
      latitude = position.latitude;
    }
    catch (e) {
      print (e);
      longitude =0;
      latitude =0;
    }
  }
}