import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../models/weather_data.dart';

class HourlyBarChart extends StatelessWidget {
  final List<HourlyData> hourlyData;

  const HourlyBarChart({super.key, required this.hourlyData});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: const CategoryAxis(),
      series: <CartesianSeries>[
        ColumnSeries<HourlyData, String>(
          dataSource: hourlyData,
          xValueMapper: (HourlyData data, _) => _extractTime(data.time),
          yValueMapper: (HourlyData data, _) => data.temperature,
          color: Colors.blue,
        )
      ],
    );
  }

  String _extractTime(String dateTime) {
    return dateTime.split(' ')[1].substring(0, 5);
  }
}
