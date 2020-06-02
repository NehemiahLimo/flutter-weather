import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';


const apikey = '9c69d0ea639c843995e6d84e92763c87';
const openurl = 'https://api.openweathermap.org/data/2.5/weather';


class WeatherModel {

  Future<dynamic> getCityData(String cityName)  async {
    var url =  '$openurl?q=$cityName&appid=$apikey&units=metric';
    NetworkHelper networkHelper =  NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

 Future <dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();


    NetworkHelper networkHelper = NetworkHelper(
        '$openurl?lat=${location.lat}&lon=${location.long}&appid=$apikey&units=metric');
    var weatherData = await networkHelper.getData();
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

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
