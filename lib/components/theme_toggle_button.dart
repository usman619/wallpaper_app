import 'package:flutter/material.dart';

class ThemeToggleButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const ThemeToggleButton({
    super.key,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey[300] : Colors.transparent,
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: isSelected ? Colors.blue : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
