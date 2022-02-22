import 'package:flutter/material.dart';

class MyTheme {
  static Color greenColor = Color(0xFF26C8AC);
  static Color redColor = Color(0xFFCA5C5D);
  static ThemeData lightTheme = ThemeData(
    highlightColor: Colors.grey,
    primaryColor: Color(0xFFFFFFFF),
    accentColor: Color(0xFFF9F9F9),
    cardColor: Color(0xFFF7F7F7),
    textTheme: TextTheme(
      button: TextStyle(
        color: Colors.black,
        fontFamily: "Josephina",
        fontSize: 30,
      ),
      subtitle1: TextStyle(
        color: greenColor,
        fontFamily: "Josephina",
        fontSize: 30,
      ),
      subtitle2: TextStyle(
        color: redColor,
        fontFamily: "Josephina",
        fontSize: 40,
      ),
      headline1: TextStyle(
        color: Colors.black,
        fontFamily: "Josephina",
        fontSize: 40,
      ),
      headline2: TextStyle(
        color: Colors.black,
        fontFamily: "Josephina",
        fontSize: 30,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    highlightColor: Colors.black,
    primaryColor: Color(0xFF22252D),
    accentColor: Color(0xFF292D36),
    cardColor: Color(0xFF272B33),
    textTheme: TextTheme(
      button: TextStyle(
        color: Colors.white,
        fontFamily: "Josephina",
        fontSize: 30,
      ),
      subtitle1: TextStyle(
        color: greenColor,
        fontFamily: "Josephina",
        fontSize: 30,
      ),
      subtitle2: TextStyle(
        color: redColor,
        fontFamily: "Josephina",
        fontSize: 40,
      ),
      headline1: TextStyle(
        color: Colors.white,
        fontFamily: "Josephina",
        fontSize: 40,
      ),
      headline2: TextStyle(
        color: Colors.white,
        fontFamily: "Josephina",
        fontSize: 30,
      ),
    ),
  );
}
