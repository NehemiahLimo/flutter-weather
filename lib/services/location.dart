import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as  htpp;



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

