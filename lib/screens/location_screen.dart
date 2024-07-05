import 'package:flutter/material.dart';
import 'package:climata/utilities/constants.dart';
import 'weather_model.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final weather;
  LocationScreen(this.weather);
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late double temperature;
  late String icon;
  late String cityName;
  late double windSpeed;

  WeatherModel weatherModel = WeatherModel();



  @override
  void initState() {

    super.initState();
    weatherUpdate(widget.weather);
  }

  void weatherUpdate(dynamic weatherData) {
    setState(() {
      if (weatherData == null){
        temperature =0;
        cityName ='Error finding city name ';
        icon = 'error';
        windSpeed =0;
        return;
      }
      temperature = weatherData['main']['temp'];
      int condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      icon = weatherModel.getWeatherIcon(condition);
      windSpeed = weatherData['wind']['speed'];
      print(windSpeed);
      print(temperature);
      print(cityName);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('images/5f357be1-9ee9-44c6-a861-ee64f338f03d.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getWeatherLocation();
                      weatherUpdate(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white54,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      var typedName =await Navigator.push(context, MaterialPageRoute(builder: (context){return CityScreen();}));
                        if (typedName != null){
                          var weatherData = await weatherModel.getCityWeather(typedName);
                          weatherUpdate(weatherData);
                        }
                      },
                    child: Icon(
                      Icons.search,
                      size: 50.0,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature',
                      style: kTempTextStyle,
                    ),
                    Text(
                        icon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "Wind Speed is $windSpeed in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
