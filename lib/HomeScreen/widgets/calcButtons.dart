import 'package:calculator/bloc.dart';
import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

  const CalcButton({super.key, required this.text, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
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
  const CalcButtons({super.key});

  @override
  State<CalcButtons> createState() => _CalcButtonsState();
}

class _CalcButtonsState extends State<CalcButtons> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(50)),
      ),
      child: GridView.count(
        primary: true,
        shrinkWrap: true,
        crossAxisSpacing: 5,
        crossAxisCount: 4,
        children: List.generate(
          numsAndOps.length,
          (index) {
            TextStyle? textStyle;
            if (index < 3) {
              textStyle = textTheme.titleMedium;
            } else if (index == 3 || index == 7 || index == 11 || index == 15 || index == 19) {
              textStyle = textTheme.titleLarge;
            } else {
              textStyle = textTheme.labelLarge;
            }
            return CalcButton(text: numsAndOps[index], textStyle: textStyle);
          },
        ),
      ),
    );
  }
}

const List<String> numsAndOps = [
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
