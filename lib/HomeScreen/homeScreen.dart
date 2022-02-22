import 'package:calculator/HomeScreen/widgets/calcButtons.dart';
import 'package:calculator/HomeScreen/widgets/calcDisplay.dart';
import 'package:calculator/bloc.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    Bloc().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: SizedBox.expand(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: CalcDisplay(
                stream: Bloc().calcDisplayStrmController.stream,
              ),
            ),
            Expanded(
              flex: 6,
              child: CalcButtons(),
            ),
          ],
        ),
      ),
    );
  }
}
