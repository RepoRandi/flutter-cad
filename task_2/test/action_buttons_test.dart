import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_2/widgets/action_buttons.dart';

void main() {
  group('ActionButtons Widget Tests', () {
    bool refreshPressed = false;
    bool exitPressed = false;

    // Function to build the widget for testing
    MaterialApp buildTestableWidget() {
      return MaterialApp(
        home: Scaffold(
          body: ActionButtons(
            onRefresh: () {
              refreshPressed = true;
            },
            onExit: () {
              exitPressed = true;
            },
          ),
        ),
      );
    }

    testWidgets('ActionButtons triggers onRefresh callback',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget());

      // Verify initial state
      expect(refreshPressed, false);
      expect(exitPressed, false);

      // Tap the refresh button
      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pump();

      // Verify that onRefresh callback is triggered
      expect(refreshPressed, true);
      expect(exitPressed, false); // Ensure exit callback is not triggered
    });

    testWidgets('ActionButtons triggers onExit callback',
        (WidgetTester tester) async {
      // Initialize the flag variables
      bool refreshPressed = false;
      bool exitPressed = false;

      // Build our widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ActionButtons(
              onRefresh: () {
                refreshPressed = true;
              },
              onExit: () {
                exitPressed = true;
              },
            ),
          ),
        ),
      );

      // Verify initial state
      expect(refreshPressed, false);
      expect(exitPressed, false);

      // Tap the exit button
      await tester.tap(find.byIcon(Icons.exit_to_app));
      await tester.pump();

      // Verify that onExit callback is triggered
      expect(exitPressed, true);
      expect(refreshPressed, false); // Ensure refresh callback is not triggered
    });
  });
}
