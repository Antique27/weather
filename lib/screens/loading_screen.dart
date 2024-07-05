
import 'package:climata/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'weather_model.dart';
import 'package:flutter_load_kit/flutter_load_kit.dart';



class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    getLocation();
    super.initState();
  }
  void getLocation()async{
  WeatherModel model = WeatherModel();
  var weatherData = await model.getWeatherLocation();
  Navigator.push(context,MaterialPageRoute(builder: (context){return LocationScreen(weatherData);}));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,

          child: LoadKitScalingWave(
            color: Colors.white,
            itemCount: 7,
          ),
        ),
      ),
    );
  }
}
