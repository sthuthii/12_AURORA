import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ingredify/main.dart'; // Make sure MyApp is imported from the correct path.

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));  // Add semicolon here
    await tester.pump();  // Make sure to trigger the pump again

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
