import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_2/widgets/weather_icon.dart';

void main() {
  testWidgets('WeatherIcon displays correct icon for different weather codes',
      (WidgetTester tester) async {
    // Test weather codes and expected asset paths
    final testData = [
      {'code': 201, 'asset': 'assets/1.png'}, // Thunderstorm
      {'code': 310, 'asset': 'assets/2.png'}, // Drizzle
      {'code': 502, 'asset': 'assets/3.png'}, // Rain
      {'code': 611, 'asset': 'assets/4.png'}, // Snow
      {'code': 721, 'asset': 'assets/5.png'}, // Atmosphere
      {'code': 800, 'asset': 'assets/6.png'}, // Clear
      {'code': 804, 'asset': 'assets/7.png'}, // Clouds
    ];

    // Run tests for each weather code
    for (final data in testData) {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WeatherIcon(data['code'] as int),
          ),
        ),
      );

      // Find the Image widget and verify its asset path
      expect(find.byType(Image), findsOneWidget);
      expect(
          find.byWidgetPredicate((widget) =>
              widget is Image &&
              widget.image is AssetImage &&
              widget.image.obtainKey == data['asset']),
          findsOneWidget);
    }
  });
}
