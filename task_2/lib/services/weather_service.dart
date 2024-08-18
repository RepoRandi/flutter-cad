import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_data.dart';

class WeatherService {
  final String apiKey = '7e87dd9928b579501bfbd482ee8409fb';

  Future<WeatherData> fetchWeatherData(
      double latitude, double longitude) async {
    final weatherUrl =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';
    final hourlyUrl =
        'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey';

    final weatherResponse = await http.get(Uri.parse(weatherUrl));
    final hourlyResponse = await http.get(Uri.parse(hourlyUrl));

    if (weatherResponse.statusCode == 200 && hourlyResponse.statusCode == 200) {
      final weatherData = json.decode(weatherResponse.body);
      final hourlyData = json.decode(hourlyResponse.body);

      weatherData['hourly'] = hourlyData['list'];

      return WeatherData.fromJson(weatherData);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
