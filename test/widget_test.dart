// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sagi_jeonae_app/src/widgets/search_result_table.dart';

void main() {
  testWidgets('BasicTable widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SearchResultTable(data: [
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
