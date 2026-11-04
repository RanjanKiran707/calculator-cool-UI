import 'package:flutter/material.dart';

class MyTheme {
  static const Color greenColor = Color(0xFF26C8AC);
  static const Color redColor = Color(0xFFCA5C5D);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    highlightColor: Colors.grey,
    primaryColor: const Color(0xFFFFFFFF),
    cardColor: const Color(0xFFF7F7F7),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFFFFFFF),
      secondary: Color(0xFFF9F9F9),
    ),
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        color: Colors.black,
        fontFamily: "Josephina",
        fontSize: 30,
      ),
      titleMedium: TextStyle(
        color: greenColor,
        fontFamily: "Josephina",
        fontSize: 30,
      ),
      titleLarge: TextStyle(
        color: redColor,
        fontFamily: "Josephina",
        fontSize: 40,
      ),
      displayLarge: TextStyle(
        color: Colors.black,
        fontFamily: "Josephina",
        fontSize: 40,
      ),
      headlineMedium: TextStyle(
        color: Colors.black,
        fontFamily: "Josephina",
        fontSize: 30,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    highlightColor: Colors.black,
    primaryColor: const Color(0xFF22252D),
    cardColor: const Color(0xFF272B33),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF22252D),
      secondary: Color(0xFF292D36),
    ),
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        color: Colors.white,
        fontFamily: "Josephina",
        fontSize: 30,
      ),
      titleMedium: TextStyle(
        color: greenColor,
        fontFamily: "Josephina",
        fontSize: 30,
      ),
      titleLarge: TextStyle(
        color: redColor,
        fontFamily: "Josephina",
        fontSize: 40,
      ),
      displayLarge: TextStyle(
        color: Colors.white,
        fontFamily: "Josephina",
        fontSize: 40,
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
        fontFamily: "Josephina",
        fontSize: 30,
      ),
    ),
  );
}
