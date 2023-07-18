 import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  dynamic data = {};

  @override
  Widget build(BuildContext context) {

    var location ='';

    var time ='';
    var isDayTime ;

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments;

      location = data['location'];
      time = data['time'];
      isDayTime = data['isDayTime'] ? "day.jpg":'night.jpg';

    Color? bgColor = data?['isDayTime'] ? Colors.yellow[50]: Colors.brown[300];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$isDayTime"),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(

              children: [
                TextButton.icon(onPressed: ()async {dynamic current = await Navigator.pushNamed(context,"/location");
                  print(current);
                  setState(() {
                    data = {
                      "location": current['location'],
                      "time": current['time'],
                      "isDayTime":current['isDayTime'],
                    };
                  });
                }, icon: Icon(
                    Icons.edit_location,
                  color: Colors.grey[300],
                ), label: Text(
                    "Edit Location",
                  style: TextStyle(
                    color: Colors.grey[300 ]
                  ),
                )),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(location,
                  style: TextStyle(
                    fontSize: 28,
                    letterSpacing: 2,
                    color: Colors.white
                  ),
                  )
                ],),
                SizedBox(height: 20,),
                Text(time,
                style: TextStyle(
                  fontSize: 66,
                    color: Colors.white
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
