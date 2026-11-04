import 'package:calculator/HomeScreen/homeScreen.dart';
import 'package:calculator/theme.dart';
import 'package:calculator/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeMode>(
      initialData: ThemeMode.dark,
      stream: Bloc().themeModeStrmController.stream,
      builder: (context, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: MyTheme.darkTheme,
          theme: MyTheme.lightTheme,
          themeMode: snapshot.data,
          title: "Calculator",
          home: const HomeScreen(),
        );
      },
    );
  }
}
