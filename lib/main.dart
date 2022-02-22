import 'package:calculator/HomeScreen/homeScreen.dart';
import 'package:calculator/theme.dart';
import 'package:calculator/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.dark;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeMode>(
      initialData: ThemeMode.dark,
      stream: Bloc().themeModeStrmController.stream,
      builder: (context, snapshot) {
        return MaterialApp(
          darkTheme: MyTheme.darkTheme,
          theme: MyTheme.lightTheme,
          themeMode: snapshot.data,
          title: "Calculator",
          home: HomeScreen(),
        );
      },
    );
  }
}
