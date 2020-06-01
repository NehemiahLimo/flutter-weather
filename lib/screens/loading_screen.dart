import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather/screens/location_screen.dart';
import 'package:weather/screens/location_screen.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const apikey ='9c69d0ea639c843995e6d84e92763c87';

class LoadingScreen extends StatefulWidget {



  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double lat;
  double long;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }


  void getLocationData() async {
    Location location = new Location();
    await location.getCurrentLocation();
    lat = location.lat;
    long = location.long;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apikey');
    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen();
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
