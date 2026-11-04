import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calculator/bloc.dart';
import 'package:calculator/main.dart';

void main() {
  testWidgets('Calculator smoke test on desktop layout', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Verify key elements are rendered.
    expect(find.text('Calculator Cool UI'), findsOneWidget);
    expect(find.text('AC'), findsWidgets);
    expect(find.byIcon(Icons.brightness_4_outlined), findsOneWidget);
    expect(find.byIcon(Icons.brightness_2_outlined), findsOneWidget);

    // Verify theme toggle is interactive
    await tester.tap(find.byIcon(Icons.brightness_4_outlined));
    await tester.pumpAndSettle();
    expect(Bloc().themeModeStrmController.hasListener, isTrue);
  });

  testWidgets('Calculator smoke test on mobile layout', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('AC'), findsWidgets);
    expect(find.byIcon(Icons.brightness_4_outlined), findsOneWidget);
    expect(find.byIcon(Icons.brightness_2_outlined), findsOneWidget);
  });
}
