class WeatherData {
  final double temperature;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final int weatherCode;
  final String description;
  final String icon;
  final String cityName;
  final List<HourlyData> hourlyData;
  final List<DailyData> dailyData;

  WeatherData({
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.weatherCode,
    required this.description,
    required this.icon,
    required this.cityName,
    required this.hourlyData,
    required this.dailyData,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    var hourlyList = json['hourly'] as List;

    List<HourlyData> hourlyData =
        hourlyList.map((i) => HourlyData.fromJson(i)).toList();
    List<DailyData> dailyData = _generateDailyData(hourlyData);

    return WeatherData(
      temperature: json['main']['temp'] - 273.15,
      feelsLike: json['main']['feels_like'] - 273.15,
      tempMin: json['main']['temp_min'] - 273.15,
      tempMax: json['main']['temp_max'] - 273.15,
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
      weatherCode: json['weather'][0]['id'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      cityName: json['name'],
      hourlyData: hourlyData,
      dailyData: dailyData,
    );
  }

  static List<DailyData> _generateDailyData(List<HourlyData> hourlyData) {
    Map<String, List<HourlyData>> dailyMap = {};

    for (var data in hourlyData) {
      String date = data.time.split(' ')[0];
      if (dailyMap.containsKey(date)) {
        dailyMap[date]!.add(data);
      } else {
        dailyMap[date] = [data];
      }
    }

    List<DailyData> dailyData = dailyMap.entries.map((entry) {
      double avgTemp =
          entry.value.map((data) => data.temperature).reduce((a, b) => a + b) /
              entry.value.length;
      String weatherIcon = entry.value[0].weatherIcon;
      return DailyData(
          date: entry.key,
          temperature: avgTemp.round(),
          weatherIcon: weatherIcon);
    }).toList();

    return dailyData;
  }
}

class HourlyData {
  final String time;
  final int temperature;
  final String weatherIcon;

  HourlyData({
    required this.time,
    required this.temperature,
    required this.weatherIcon,
  });

  factory HourlyData.fromJson(Map<String, dynamic> json) {
    return HourlyData(
      time: json['dt_txt'],
      temperature: (json['main']['temp'] - 273.15).round(),
      weatherIcon: json['weather'][0]['icon'],
    );
  }
}

class DailyData {
  final String date;
  final int temperature;
  final String weatherIcon;

  DailyData(
      {required this.date,
      required this.temperature,
      required this.weatherIcon});

  factory DailyData.fromJson(Map<String, dynamic> json) {
    return DailyData(
      date: json['dt_txt'],
      temperature: (json['main']['temp'] - 273.15).round(),
      weatherIcon: json['weather'][0]['icon'],
    );
  }
}
