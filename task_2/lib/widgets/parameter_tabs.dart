import 'package:flutter/material.dart';

class ParameterTabs extends StatefulWidget {
  final Function(int) onTabSelected;

  const ParameterTabs({super.key, required this.onTabSelected});

  @override
  State<ParameterTabs> createState() => _ParameterTabsState();
}

class _ParameterTabsState extends State<ParameterTabs> {
  int selectedTabIndex = 0;

  void _selectTab(int index) {
    setState(() {
      selectedTabIndex = index;
    });
    widget.onTabSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTab(0, 'Temperature'),
        _buildTab(1, 'Humidity'),
        _buildTab(2, 'Barometer'),
      ],
    );
  }

  Widget _buildTab(int index, String label) {
    final isSelected = index == selectedTabIndex;
    return isSelected
        ? ElevatedButton(
            onPressed: () => _selectTab(index),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
            ),
            child: Text(label),
          )
        : OutlinedButton(
            onPressed: () => _selectTab(index),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue,
              side: const BorderSide(color: Colors.blue),
            ),
            child: Text(label),
          );
  }
}
