import 'dart:async';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Bloc {
  Bloc._();

  static Bloc _bloc;
  factory Bloc() {
    if (_bloc == null) {
      _bloc = Bloc._();
    }

    return _bloc;
  }

  StreamController<ThemeMode> themeModeStrmController = StreamController<ThemeMode>.broadcast();
  StreamController<List<String>> calcDisplayStrmController = StreamController<List<String>>.broadcast();

  dispose() {
    calcDisplayStrmController.close();
    themeModeStrmController.close();
  }

  toggleMode(ThemeMode themeMode) {
    themeModeStrmController.add(themeMode);
  }

  final List<String> children = [];

  String expression = "";
  calcButtonPress(String text) {
    if (text != "\u00B1") {
      if (text == "=") {
        Parser p = Parser();
        try {
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          answer.value = eval.toStringAsPrecision(10);
        } catch (e) {
          print(e);
          answer.value = "Syntax Error";
        }
      } else if (text == "%") {
        expression += "%";
        children.add("%");
      } else if (text == "+" || text == "\u00F7" || text == "\u00D7" || text == "-") {
        switch (text) {
          case "\u00F7":
            expression += "/";
            break;
          case "\u00D7":
            expression += "*";
            break;
          default:
            expression += text;
        }
        children.add(text);
      } else if (text == "AC") {
        expression = "";
        children.clear();
        answer.value = "";
      } else if (text == "\u21A9") {
        expression = expression.substring(0, expression.length - 1);
        children.removeLast();
      } else {
        children.add(text);
        expression += text;
      }
    }
    calcDisplayStrmController.add(children);
  }

  ValueNotifier<String> answer = ValueNotifier<String>("");
}
