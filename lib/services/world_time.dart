import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time= '';
  String flag;
  String url;
  bool isDayTime = true;

  WorldTime({required this.location, required this.flag, required this.url});



  Future<void> getTime() async {

    try{
    var urls =
    Uri.https('worldtimeapi.org', '/api/timezone/$url');
    Response response = await get(urls);
    Map jsonResponse = jsonDecode(response.body);


    String dateTime = jsonResponse['datetime'];
    String offset = jsonResponse['utc_offset'].substring(1,3);
    var offsetInt = int.parse(offset);

    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours:offsetInt ));
    time = DateFormat.jm().format(now);
    if(time.endsWith("PM")){
      isDayTime = false ;
    }
  }
  catch(e){
      print("Caught error $e");
      time = "Could not get time data";
  }

  }

}