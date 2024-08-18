import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:task_2/widgets/date_time.dart';

void main() {
  testWidgets('DateTimes widget updates time correctly',
      (WidgetTester tester) async {
    // Build the DateTimes widget
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: DateTimes(),
      ),
    ));

    // Get the initial display of date and time
    String initialDateTime = _getCurrentDateTime();

    // Expect the initial display to match the current date and time
    expect(find.text(initialDateTime), findsOneWidget);

    // Wait for 1 second to allow widget to update
    await Future.delayed(const Duration(seconds: 1));

    // Get the updated display of date and time
    String updatedDateTime = _getCurrentDateTime();

    // Expect the updated display to match the current date and time after 1 second
    expect(find.text(updatedDateTime), findsOneWidget);
  });
}

String _getCurrentDateTime() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('EEEE dd MMMM •').format(now);
  String formattedTime = DateFormat('HH:mm:ss').format(now);
  return '$formattedDate $formattedTime';
}
