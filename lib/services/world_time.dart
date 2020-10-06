
import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';


class WorldTime {
  String location; // Location of the place
  String time;
  String flag; // flag of the nation
  String url;
  bool isDayTime = true;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(0,1);
      String offsetHour = data['utc_offset'].substring(1,3);
      String offsetMin = data['utc_offset'].substring(4,6);

      DateTime now = DateTime.parse(dateTime);
      if( offset == '+') {
        now = now.add(Duration(
            hours: int.parse(offsetHour), minutes: int.parse(offsetMin)));
      }
      else {
        now = now.subtract(Duration(
            hours: int.parse(offsetHour), minutes: int.parse(offsetMin)));
      }
      isDayTime = now.hour >= 6 && now.hour <= 20;
      print(now);
      time = DateFormat.jm().format(now);
    }

    catch(e) {
      print('Caught Exception $e');
      time = 'Could Not get Data';
    }

  }
}