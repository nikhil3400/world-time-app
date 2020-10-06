import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'Kolkata', flag: 'India.png', url: 'Asia/Kolkata'),
    WorldTime(location: 'New York', flag: 'USA.png', url: 'America/New_York'),
    WorldTime(location: 'London', flag: 'UK.png', url: 'Europe/London'),
    WorldTime(location: 'Kuala Lumpur', flag: 'Malaysia.png', url: 'Asia/Kuala_Lumpur'),
    WorldTime(location: 'Melbourne', flag: 'Australia.png', url: 'Australia/Melbourne'),
    WorldTime(location: 'Tokyo', flag: 'Japan.png', url: 'Asia/Tokyo'),
    WorldTime(location: 'Moscow', flag: 'Russia.png', url: 'Europe/Moscow'),
    WorldTime(location: 'Berlin', flag: 'Germany.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Cairo', flag: 'Egypt.png', url: 'Africa/Cairo'),
    WorldTime(location: 'San Juan', flag: 'Argentina.png', url: 'America/Argentina/San_Juan'),
  ];

  void updateTime(index) async {
      WorldTime instance = locations[index];
      await instance.getTime();
      Navigator.pop(context,{
        'location': instance.location,
        'time': instance.time,
        'flag': instance.flag,
        'isDayTime': instance.isDayTime,
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
           child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
