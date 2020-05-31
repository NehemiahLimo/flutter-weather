import 'package:geolocator/geolocator.dart';



class Location{
  double lat;
  double long;

  Future <void> getCurrentLocation() async{
    try{
      Position position = await Geolocator().getLastKnownPosition(desiredAccuracy: LocationAccuracy.low);
      lat= position.latitude;
      long = position.longitude;
      //(position);
    }
    catch(e){
      print(e);
    }

  }
}