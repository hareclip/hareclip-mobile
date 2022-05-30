import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFFC12A2A),
  backgroundColor: Colors.grey[200],
  primarySwatch: Colors.red,
  textTheme: TextTheme(
    bodyText1: TextStyle(fontSize: 18.0, color: Color(0xFFC12A2A), height: 1.5),
    bodyText2: TextStyle(fontSize: 18.0, color: Colors.grey[700], height: 1.5),
    headline4: TextStyle(color: Colors.black),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.red,
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFFC12A2A),
  backgroundColor: Colors.grey[900],
  primarySwatch: Colors.red,
  textTheme: TextTheme(
    bodyText1: TextStyle(fontSize: 18.0, color: Color(0xFFC12A2A), height: 1.5),
    bodyText2: TextStyle(fontSize: 18.0, color: Colors.grey[350], height: 1.5),
    headline4: TextStyle(color: Colors.white),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.red,
  ),
);
