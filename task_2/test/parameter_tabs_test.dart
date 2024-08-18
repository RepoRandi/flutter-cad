import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_2/widgets/parameter_tabs.dart';

void main() {
  testWidgets('ParameterTabs widget displays tabs correctly',
      (WidgetTester tester) async {
    // Define variables for tracking selected tab and callback invocation
    int selectedTab = -1;

    // Build the ParameterTabs widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ParameterTabs(
          onTabSelected: (index) {
            selectedTab = index;
          },
        ),
      ),
    ));

    // Wait for the widget to settle
    await tester.pumpAndSettle();

    // Verify initial state
    expect(find.widgetWithText(ElevatedButton, 'Temperature'), findsOneWidget);
    expect(find.widgetWithText(OutlinedButton, 'Humidity'), findsOneWidget);
    expect(find.widgetWithText(OutlinedButton, 'Barometer'), findsOneWidget);

    // Tap on the 'Temperature' tab
    await tester.tap(find.widgetWithText(ElevatedButton, 'Temperature'));
    await tester.pump();

    // Wait for the widget to settle
    await tester.pumpAndSettle();

    // Verify that the 'Temperature' tab is selected
    expect(selectedTab, 0);

    // Tap on the 'Humidity' tab
    await tester.tap(find.widgetWithText(OutlinedButton, 'Humidity'));
    await tester.pump();

    // Wait for the widget to settle
    await tester.pumpAndSettle();

    // Verify that the 'Humidity' tab is selected
    expect(selectedTab, 1);

    // Tap on the 'Barometer' tab
    await tester.tap(find.widgetWithText(OutlinedButton, 'Barometer'));
    await tester.pump();

    // Wait for the widget to settle
    await tester.pumpAndSettle();

    // Verify that the 'Barometer' tab is selected
    expect(selectedTab, 2);
  });
}
