import 'package:cancellable_operations/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cancellable operations',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
          headlineMedium: const TextStyle(color: Colors.black, fontSize: 30),
          bodyMedium: const TextStyle(color: Colors.black, fontSize: 20),
          labelMedium: const TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
