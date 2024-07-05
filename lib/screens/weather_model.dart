import 'networking.dart';
import 'package:climata/screens/location.dart';
const apikey ='3a45e2d28c3e425b24d1e7cfaaf845ed';

class WeatherModel {
  late double Latitude;
  late double Longitude;
  Future<dynamic> getCityWeather(String cityName)async{
    var url ='https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=metric';
    network Network = network(url);
    var weatherDate = await Network.getData();
    return weatherDate;
  }

  Future<dynamic> getWeatherLocation() async{
    Location location =Location();
    await location.getCurrentLocation();
    Latitude =location.latitude;
    Longitude = location.longitude;
    network Network = network('https://api.openweathermap.org/data/2.5/weather?lat=$Latitude&lon=$Longitude&appid=$apikey&units=metric');
    var weatherData = await Network.getData();
    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

}