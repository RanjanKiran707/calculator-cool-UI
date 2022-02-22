import 'package:calculator/bloc.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;

  CalcButton({Key key, this.text, this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        onPressed: () {
          Bloc().calcButtonPress(text);
        },
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}

class CalcButtons extends StatefulWidget {
  @override
  _CalcButtonsState createState() => _CalcButtonsState();
}

class _CalcButtonsState extends State<CalcButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: context.accentColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      child: GridView.count(
        primary: true,
        shrinkWrap: true,
        crossAxisSpacing: 5,
        crossAxisCount: 4,
        children: List.generate(
          numsAndOps.length,
          (index) {
            TextStyle textStyle;
            if (index < 3) {
              textStyle = context.textTheme.subtitle1;
            } else if (index == 3 || index == 7 || index == 11 || index == 15 || index == 19) {
              textStyle = context.textTheme.subtitle2;
            } else {
              textStyle = context.textTheme.button;
            }
            return CalcButton(text: numsAndOps[index], textStyle: textStyle);
          },
        ),
      ),
    );
  }
}

List<String> numsAndOps = [
  "AC",
  "\u00B1",
  "%",
  "\u00F7",
  "7",
  "8",
  "9",
  "\u00D7",
  "4",
  "5",
  "6",
  "-",
  "1",
  "2",
  "3",
  "+",
  "\u21A9",
  "0",
  ".",
  "=",
];
