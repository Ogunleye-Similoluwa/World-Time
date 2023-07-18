import 'package:flutter/material.dart';
import 'package:world_time/services//world_time.dart';

class choose_location extends StatefulWidget {
  const choose_location({super.key});

  @override
  State<choose_location> createState() => _choState();
}

class _choState extends State<choose_location> {

  List<WorldTime> cities = [
    WorldTime(location: "Berlin", flag: 'germany.png', url: "Europe/Berlin"),
    WorldTime(location: "New York", flag: 'usa.png', url: "America/New_York"),
    WorldTime(location: "Tokyo", flag: 'japan.png', url: "Asia/Tokyo"),
    WorldTime(location: "Paris", flag: 'france.png', url: "Europe/Paris"),
    WorldTime(location: "London", flag: 'uk.png', url: "Europe/London"),
    WorldTime(location: "Sydney", flag: 'australia.png', url: "Australia/Sydney"),
    WorldTime(location: "Cairo", flag: 'egypt.png', url: "Africa/Cairo"),
    WorldTime(location: "Moscow", flag: 'russia.png', url: "Europe/Moscow"),
    WorldTime(location: "Beijing", flag: 'china.png', url: "Asia/Shanghai"),
    WorldTime(location: "Rio de Janeiro", flag: 'brazil.png', url: "America/Sao_Paulo"),
    WorldTime(location: "Amsterdam", flag: 'netherlands.png', url: "Europe/Amsterdam"),
    WorldTime(location: "Toronto", flag: 'canada.png', url: "America/Toronto"),
    WorldTime(location: "Mexico City", flag: 'mexico.png', url: "America/Mexico_City"),
    WorldTime(location: "Dubai", flag: 'uae.png', url: "Asia/Dubai"),
    WorldTime(location: "Rome", flag: 'italy.png', url: "Europe/Rome"),
    WorldTime(location: "Bangkok", flag: 'thailand.png', url: "Asia/Bangkok"),
    WorldTime(location: "Mumbai", flag: 'india.png', url: "Asia/Kolkata"),
    WorldTime(location: "Sydney", flag: 'australia.png', url: "Australia/Sydney"),
    WorldTime(location: "Lagos", flag: 'nigeria.png', url: "Africa/Lagos"),
    WorldTime(location: "Stockholm", flag: 'sweden.png', url: "Europe/Stockholm"),
    WorldTime(location: "Cape Town", flag: 'south_africa.png', url: "Africa/Johannesburg"),
  ];

  void updateTime(index) async {
    WorldTime current = cities[index];
    await current.getTime();
    Navigator.pop(context,{
      "location": current.location,
      "flag": current.flag,
      "time": current.time,
      "isDayTime":current.isDayTime
    },);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose Location"),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: cities.length,
      itemBuilder:(context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap:  (){
                  updateTime(index);
                },
                title: Text(cities[index].location),
                leading: CircleAvatar(backgroundImage:AssetImage('flag_icons/${cities[index].flag}'),),
              ),
            ),
          );
      },
      ),
    );
  }
}
