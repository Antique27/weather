import 'package:climata/screens/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apikey ='3a45e2d28c3e425b24d1e7cfaaf845ed';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double Latitude;
  late double Longitude;
  @override
  void initState() {
    getLocation();
    super.initState();
  }
  void getLocation()async{
  Location location =Location();
  await location.getCurrentLocation();
  Latitude =location.latitude;
  Longitude = location.longitude;
  getData();
  }
  void getData()async{
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$Latitude&lon=$Longitude&appid=$apikey'));
    String data = response.body;
    var cityName = jsonDecode(data)['name'];
    print(cityName);
    print(Latitude);
    print(Longitude);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold();
  }
}
