import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'kototinder',
      theme: ThemeData(fontFamily: 'Arial'),
      home: const HomeScreen(),
    ),
  );
}
