import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onRefresh;
  final VoidCallback onExit;

  const ActionButtons(
      {super.key, required this.onRefresh, required this.onExit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FloatingActionButton(
          backgroundColor: Colors.blue,
          heroTag: 'refreshButton',
          onPressed: onRefresh,
          child: const Icon(
            Icons.refresh,
            color: Colors.white,
          ),
        ),
        FloatingActionButton(
          backgroundColor: Colors.blue,
          heroTag: 'exitButton',
          onPressed: onExit,
          child: const Icon(
            Icons.exit_to_app,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
