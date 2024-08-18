import 'package:flutter/material.dart';

class DigitInput extends StatelessWidget {
  final TextEditingController controller;
  final void Function() onPressed;

  const DigitInput(
      {super.key, required this.controller, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter Digit',
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: onPressed,
          child: const Text('Find Nth Digit'),
        ),
      ],
    );
  }
}
