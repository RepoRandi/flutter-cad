import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:task_2/widgets/hourly_bar_chart.dart';
import 'package:task_2/models/weather_data.dart';

void main() {
  group('HourlyBarChart Widget Tests', () {
    // Helper function to pump HourlyBarChart widget
    Future<void> pumpHourlyBarChart(
        WidgetTester tester, List<HourlyData> hourlyData) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HourlyBarChart(hourlyData: hourlyData),
          ),
        ),
      );
      await tester
          .pumpAndSettle(); // Wait for animation and rendering to complete.
    }

    testWidgets('HourlyBarChart renders correctly with valid data',
        (WidgetTester tester) async {
      // Create mock hourly data for testing
      final List<HourlyData> mockHourlyData = [
        HourlyData(
            time: '2024-07-14 12:00:00', temperature: 25, weatherIcon: '01d'),
        HourlyData(
            time: '2024-07-14 13:00:00', temperature: 26, weatherIcon: '02d'),
        HourlyData(
            time: '2024-07-14 14:00:00', temperature: 27, weatherIcon: '03d'),
      ];

      await pumpHourlyBarChart(tester, mockHourlyData);

      // Verify that the chart renders
      expect(find.byType(SfCartesianChart), findsOneWidget);

      // Verify the number of data points rendered
      final chart =
          tester.widget<SfCartesianChart>(find.byType(SfCartesianChart));
      expect(chart.series.length, equals(1)); // Only one series is expected

      // Optionally, you can check specific data points if needed
      expect(mockHourlyData.length, equals(chart.series[0].dataSource!.length));
    });

    testWidgets('HourlyBarChart handles empty data gracefully',
        (WidgetTester tester) async {
      // Simulate empty data scenario
      final List<HourlyData> emptyHourlyData = [];

      await pumpHourlyBarChart(tester, emptyHourlyData);

      // Verify that the chart still renders without errors
      expect(find.byType(SfCartesianChart), findsOneWidget);
    });
  });
}
