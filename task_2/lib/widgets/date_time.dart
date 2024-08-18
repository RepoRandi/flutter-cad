import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimes extends StatefulWidget {
  const DateTimes({super.key});

  @override
  State<DateTimes> createState() => _DateTimesState();
}

class _DateTimesState extends State<DateTimes> {
  String _currentDateTime = '';

  @override
  void initState() {
    super.initState();
    _updateDateTime();
  }

  void _updateDateTime() {
    setState(() {
      _currentDateTime = _getCurrentDateTime();
    });

    Future.delayed(const Duration(seconds: 1), _updateDateTime);
  }

  String _getCurrentDateTime() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE dd MMMM •').format(now);
    String formattedTime = DateFormat('HH:mm:ss').format(now);
    return '$formattedDate $formattedTime';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _currentDateTime,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
    );
  }
}
