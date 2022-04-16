import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

var appTheme = ThemeData(
  // fontFamily: GoogleFonts.nunito().fontFamily,
  // bottomAppBarTheme: BottomAppBarTheme(
  //   color: Colors.blue.shade100,
  // ),
  // brightness: Brightness.dark,
  // textTheme: const TextTheme(
  //   bodyText1: TextStyle(fontSize: 18),
  //   bodyText2: TextStyle(fontSize: 16),
  //   button: TextStyle(
  //     letterSpacing: 1.5,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   headline1: TextStyle(fontWeight: FontWeight.bold),
  //   subtitle1: TextStyle(color: Colors.grey),
  // ),
  scaffoldBackgroundColor: Colors.indigo[50],
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(20),
      primary: Colors.blue[700],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blue[700],
  ),
  // buttonTheme: const ButtonThemeData(buttonColor: Colors.pink),
  appBarTheme: AppBarTheme(backgroundColor: Colors.blue[700]),
  brightness: Brightness.light,
  // bottomNavigationBarTheme: BottomNavigationBar(
  //   items: [BottomNa],
  // ),
);
