// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sagi_jeonae_app/main.dart';
import 'package:sagi_jeonae_app/src/common/widgets/basic_button.dart';
import 'package:sagi_jeonae_app/src/common/widgets/basic_table.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('BasicButton widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BasicButton(
            onPressed: () {}, // Add any required parameters
            text: 'Test Button', // Add any required parameters
          ),
        ),
      ),
    );

    // Verify if the widget is rendered on the screen.
    expect(find.text('Test Button'), findsOneWidget);

    // Trigger a tap on the button.
    await tester.tap(find.text('Test Button'));
    await tester.pump();

    // Verify if the button press works as expected.
    // Add more assertions as needed.
  });

  testWidgets('BasicTable widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: BasicTable(data: [
            ['1', 'aaa'],
            ['2', 'bbb']
          ],),
        ),
      ),
    );

    // Verify if the widget is rendered on the screen.
    // Add more assertions for CustomTable as needed.
  });
}
