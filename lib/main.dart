
import 'package:flutter/material.dart';
import "package:world_time/pages/home.dart";
import "package:world_time/pages/loading.dart";
import "package:world_time/pages/choose_location.dart";

void main() {
  runApp(MaterialApp(

    initialRoute: "/",

    routes: {
      "/": (context){
        return loading_screen();
      },
      "/home": (context){
        return Home();
      },
      "/location": (context){
        return choose_location();
      }
    },
  ));
}
