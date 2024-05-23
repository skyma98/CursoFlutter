import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(149, 74, 212, 53);

const List<Color> _colorTheme = [
  _customColor,
  Colors.blue,
  Colors.orange,
  Colors.red,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
  }) : assert(selectedColor >= 0, 'Color debe ser mauyor a cero');

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colorTheme[selectedColor],
    );
  }
}
