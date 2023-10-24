import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme=ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      color: Colors.blue,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    titleSpacing: 25.0,
    backgroundColor: Colors.white,
    shadowColor: Colors.grey,
    elevation: 7.0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.blueGrey,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    ),
  ),
);
ThemeData darkTheme=ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: HexColor('171733'),
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: const TextStyle(
      color: Colors.blue,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    titleSpacing: 25.0,
    backgroundColor: HexColor('444454'),
    shadowColor: Colors.grey,
    elevation: 7.0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: HexColor('353549'),
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.blueGrey,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: HexColor('999999'),
    ),
  ),
);