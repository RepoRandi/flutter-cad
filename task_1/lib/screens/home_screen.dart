import 'package:flutter/material.dart';
import '../utils/find_nth_digit.dart';
import '../widgets/digit_input.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  void _findNthDigit() {
    int? digit = int.tryParse(_controller.text);
    if (digit != null) {
      try {
        final result = findNthDigit(digit);
        setState(() {
          _result =
              '${digit}th digit number is ${result.nthDigit} lies on number ${result.correspondingNumber}.';
        });
      } catch (e) {
        setState(() {
          _result = e.toString();
        });
      }
    } else {
      setState(() {
        _result = 'Please enter a valid number';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Developer Test - Task 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DigitInput(controller: _controller, onPressed: _findNthDigit),
            const SizedBox(height: 20),
            Text(_result),
          ],
        ),
      ),
    );
  }
}
