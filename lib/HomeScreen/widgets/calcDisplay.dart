import 'package:calculator/bloc.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CalcDisplay extends StatelessWidget {
  final Stream<List<String>> stream;

  CalcDisplay({Key key, this.stream}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SizedBox.expand(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: StreamBuilder<List<String>>(
                    stream: stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return RichText(
                          text: TextSpan(
                            children: snapshot.data.map(
                              (e) {
                                if (e == "+" || e == "\u00F7" || e == "\u00D7" || e == "-") {
                                  return TextSpan(text: " " + e + " ", style: context.textTheme.subtitle2);
                                } else if (e == "%") {
                                  return TextSpan(text: " " + e + " ", style: context.textTheme.subtitle1);
                                } else {
                                  return TextSpan(text: e, style: context.textTheme.headline2);
                                }
                              },
                            ).toList(),
                          ),
                        ).pSymmetric(h: 20);
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ValueListenableBuilder(
                    valueListenable: Bloc().answer,
                    builder: (context, value, child) {
                      return Text(value, style: context.textTheme.headline1).pSymmetric(h: 20);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
            decoration: BoxDecoration(
              color: context.accentColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(top: 16),
            child: StreamBuilder<ThemeMode>(
              initialData: ThemeMode.dark,
              stream: Bloc().themeModeStrmController.stream,
              builder: (context, snapshot) {
                bool isLight = snapshot.data == ThemeMode.light ? true : false;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      child: Icon(Icons.brightness_4_outlined, color: isLight ? Colors.black : Colors.grey),
                      onTap: isLight ? null : () => Bloc().toggleMode(ThemeMode.light),
                    ),
                    30.widthBox,
                    GestureDetector(
                      child: Icon(Icons.brightness_2_outlined, color: isLight ? Colors.grey : Colors.white),
                      onTap: isLight ? () => Bloc().toggleMode(ThemeMode.dark) : null,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
