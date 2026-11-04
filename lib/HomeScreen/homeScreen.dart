import 'package:calculator/HomeScreen/widgets/calcButtons.dart';
import 'package:calculator/HomeScreen/widgets/calcDisplay.dart';
import 'package:calculator/HomeScreen/widgets/desktop_info_pane.dart';
import 'package:calculator/HomeScreen/widgets/phone_frame.dart';
import 'package:calculator/bloc.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    Bloc().dispose();
    super.dispose();
  }

  Widget _buildCalculatorBody() {
    return const SizedBox.expand(
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: CalcDisplay(),
          ),
          Expanded(
            flex: 6,
            child: CalcButtons(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        // Desktop Web: 2-column layout (Left: info pane, Right: bevel phone mockup)
        if (constraints.maxWidth >= 900) {
          return Scaffold(
            backgroundColor: theme.primaryColor,
            body: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1120),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Left pane: Project info
                      const Expanded(
                        flex: 5,
                        child: DesktopInfoPane(),
                      ),

                      const SizedBox(width: 48),

                      // Right pane: Project running inside a phone frame bevel
                      Expanded(
                        flex: 5,
                        child: Center(
                          child: PhoneFrame(
                            child: Scaffold(
                              backgroundColor: theme.primaryColor,
                              body: _buildCalculatorBody(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        // Mobile Web & Mobile: Same as before (fullscreen calculator)
        return Scaffold(
          backgroundColor: theme.primaryColor,
          body: _buildCalculatorBody(),
        );
      },
    );
  }
}
