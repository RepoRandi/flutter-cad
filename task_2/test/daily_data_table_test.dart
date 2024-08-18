import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:task_2/models/weather_data.dart';
import 'package:task_2/widgets/daily_data_table.dart';

void main() {
  group('DailyDataTable Widget Tests', () {
    testWidgets('Widget renders with correct data',
        (WidgetTester tester) async {
      // Test data
      final List<DailyData> testData = [
        DailyData(date: '2024-07-15', temperature: 25, weatherIcon: '01d'),
        DailyData(date: '2024-07-16', temperature: 26, weatherIcon: '02d'),
      ];

      // Build DailyDataTable widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DailyDataTable(dailyData: testData),
          ),
        ),
      );

      // Verify DataTable headers
      expect(find.text('Day'), findsOneWidget);
      expect(find.text('Temperature'), findsOneWidget);
      expect(find.text('Weather'), findsOneWidget);

      // Verify DataTable rows based on testData
      for (var data in testData) {
        expect(find.text(_formatDate(data.date)), findsOneWidget);
        expect(find.text('${data.temperature}°C'), findsOneWidget);
        expect(
            find.byWidgetPredicate(
                (widget) => widget is Image && widget.image is NetworkImage),
            findsOneWidget);
      }
    });

    test('Date formatting test', () {
      final formattedDate = _formatDate('2024-07-15');
      expect(formattedDate,
          'Monday'); // Adjust based on your locale's weekday format
    });
  });
}

String _formatDate(String date) {
  DateTime parsedDate = DateTime.parse(date);
  String formattedDate = DateFormat('EEEE').format(parsedDate);
  return formattedDate;
}
