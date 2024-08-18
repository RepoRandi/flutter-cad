import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final int weatherCode;

  const WeatherIcon(this.weatherCode, {super.key});

  @override
  Widget build(BuildContext context) {
    String assetPath;

    if (weatherCode >= 200 && weatherCode < 300) {
      assetPath = 'assets/1.png';
    } else if (weatherCode >= 300 && weatherCode < 400) {
      assetPath = 'assets/2.png';
    } else if (weatherCode >= 500 && weatherCode < 600) {
      assetPath = 'assets/3.png';
    } else if (weatherCode >= 600 && weatherCode < 700) {
      assetPath = 'assets/4.png';
    } else if (weatherCode >= 700 && weatherCode < 800) {
      assetPath = 'assets/5.png';
    } else if (weatherCode == 800) {
      assetPath = 'assets/6.png';
    } else if (weatherCode > 800 && weatherCode <= 804) {
      assetPath = 'assets/7.png';
    } else {
      assetPath = 'assets/7.png';
    }

    return Image.asset(assetPath);
  }
}
