import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/weather_data.dart';

class DailyDataTable extends StatelessWidget {
  final List<DailyData> dailyData;

  const DailyDataTable({super.key, required this.dailyData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(bottom: 20),
        child: DataTable(
          columnSpacing: 20,
          headingRowColor:
              WidgetStateColor.resolveWith((states) => Colors.blue[50]!),
          border: TableBorder.all(color: Colors.blue),
          columns: const [
            DataColumn(
              label: Text(
                'Day',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Temperature',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Weather',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
          rows: dailyData.map((data) {
            String formattedDate = _formatDate(data.date);

            return DataRow(
              cells: [
                DataCell(
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      formattedDate,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                DataCell(
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      '${data.temperature}°C',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                DataCell(
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Image.network(
                      'http://openweathermap.org/img/wn/${data.weatherIcon}@2x.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  String _formatDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    String formattedDate = DateFormat('EEEE').format(parsedDate);
    return formattedDate;
  }
}
