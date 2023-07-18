import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading_screen extends StatefulWidget {
  const loading_screen({super.key});

  @override
  State<loading_screen> createState() => _loading_screenState();
}

class _loading_screenState extends State<loading_screen> {

  String time = 'Loading';

  void setupWorldTime() async{
    WorldTime worldTime = WorldTime(location: "Berlin", flag: 'germany.png', url:"Europe/Berlin");
    await worldTime.getTime();
   Navigator.pushReplacementNamed(context,"/home", arguments: {
     "location": worldTime.location,
     "flag": worldTime.flag,
     "time": worldTime.time,
     "isDayTime":worldTime.isDayTime
   });
  }

  @override
  void initState()  {
    super.initState();
   setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.red,
          size: 50,
        ) ,
      )
    );
  }
}
