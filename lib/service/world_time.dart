import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location; // location name for the ui
  String time=''; // the time in that location
  String flag; // asset flag icon
  String url; // location url for the api endpoints

  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async {
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    //print(data);

    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(0,3);
    //print(datetime);
    //print(offset);

    DateTime now = DateTime.parse(datetime);
    //print(now);
    now = now.add(Duration(hours: int.parse(offset)));
    //print(now);

    // set the time property
    time = now.toString();
  }
}
