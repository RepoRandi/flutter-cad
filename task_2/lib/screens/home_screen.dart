import 'package:flutter/material.dart';

import '../models/weather_data.dart';
import '../services/weather_service.dart';
import '../widgets/date_time.dart';
import '../widgets/parameter_tabs.dart';
import '../widgets/hourly_bar_chart.dart';
import '../widgets/daily_data_table.dart';
import '../widgets/action_buttons.dart';
import '../widgets/weather_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<WeatherData> weatherData;
  int selectedTab = 0;

  @override
  void initState() {
    super.initState();
    weatherData = WeatherService().fetchWeatherData(-7.983908, 112.621391);
  }

  void _refreshData() {
    setState(() {
      weatherData = WeatherService().fetchWeatherData(-7.983908, 112.621391);
    });
  }

  void _exitApp() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<WeatherData>(
        future: weatherData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            return Container(
              height: MediaQuery.of(context).size.height,
              padding:
                  const EdgeInsets.fromLTRB(16, 1.0 * kToolbarHeight, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ParameterTabs(onTabSelected: (index) {
                    setState(() {
                      selectedTab = index;
                    });
                  }),
                  const SizedBox(height: 12.0),
                  Text('📍 ${data.cityName}'),
                  Expanded(
                    flex: 2,
                    child: Center(child: WeatherIcon(data.weatherCode)),
                  ),
                  if (selectedTab == 0)
                    Center(
                      child: Text(
                        '${data.temperature.round()}°C',
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue),
                      ),
                    ),
                  if (selectedTab == 1)
                    Center(
                      child: Text(
                        '${data.humidity}%',
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue),
                      ),
                    ),
                  if (selectedTab == 2)
                    Center(
                      child: Text(
                        '${data.pressure} hPa',
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue),
                      ),
                    ),
                  const Center(child: DateTimes()),
                  const SizedBox(height: 5.0),
                  const Divider(),
                  Expanded(
                    flex: 4,
                    child: HourlyBarChart(hourlyData: data.hourlyData),
                  ),
                  const Divider(),
                  const SizedBox(height: 10.0),
                  const Text('Daily Historical Data'),
                  const SizedBox(height: 10.0),
                  Expanded(
                    flex: 4,
                    child: DailyDataTable(dailyData: data.dailyData),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: ActionButtons(
          onRefresh: _refreshData,
          onExit: _exitApp,
        ),
      ),
    );
  }
}
