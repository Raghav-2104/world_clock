import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{
  late String location;  //location name for the UI
  late String time;  //Time at that location
  late String flag; //URL to assest flag icon
  late String url; //Location URL for API endpoint

  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime () async
  {
    //make request
    Response response=await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data=jsonDecode(response.body);
    // print(data);

    //  get properties from data
    String datetime=data['datetime'];
    String offset=data['utc_offset'];
    // print(datetime);
    // print(offset);

    //Create DataTime object
    DateTime now=DateTime.parse(datetime);
    now=now.add(Duration(hours: int.parse(offset.substring(0,3)),minutes:int.parse(offset.substring(4,6)) ));
    time=now.toString();
  }
}