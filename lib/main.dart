import 'package:flutter/material.dart';
import 'package:travel_apps/ui/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///route screen awal dibuka
      home: HomeScreen(),


    );
  }
}
