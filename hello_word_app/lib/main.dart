import 'package:flutter/material.dart';
import 'package:hello_word_app/presentation/screen/counter/counter_function_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorSchemeSeed: Colors.blue),
        home: const CounterFunctionScreen());
  }
}
