import 'package:calculator/bloc.dart';
import 'package:flutter/material.dart';

class CalcDisplay extends StatelessWidget {
  const CalcDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

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
                    stream: Bloc().calcDisplayStrmController.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: RichText(
                            text: TextSpan(
                              children: snapshot.data!.map(
                                (e) {
                                  if (e == "+" || e == "\u00F7" || e == "\u00D7" || e == "-") {
                                    return TextSpan(text: " $e ", style: textTheme.titleLarge);
                                  } else if (e == "%") {
                                    return TextSpan(text: " $e ", style: textTheme.titleMedium);
                                  } else {
                                    return TextSpan(text: e, style: textTheme.headlineMedium);
                                  }
                                },
                              ).toList(),
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ValueListenableBuilder<String>(
                    valueListenable: Bloc().answer,
                    builder: (context, value, child) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(value, style: textTheme.displayLarge),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        SafeArea(
          bottom: false,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(top: 14),
              child: StreamBuilder<ThemeMode>(
                initialData: ThemeMode.dark,
                stream: Bloc().themeModeStrmController.stream,
                builder: (context, snapshot) {
                  final isLight = snapshot.data == ThemeMode.light;
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        child: Icon(Icons.brightness_4_outlined, color: isLight ? Colors.black : Colors.grey),
                        onTap: isLight ? null : () => Bloc().toggleMode(ThemeMode.light),
                      ),
                      const SizedBox(width: 30),
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
        ),
      ],
    );
  }
}
