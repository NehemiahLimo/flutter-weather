import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState(){
    super.initState();

    getLocation()
    ;
  }




  void getLocation() async {
    Location location=new Location();
    location.getCurrentLocation();
    print(location.lat);
    print(location.long);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
