import 'package:flutter/material.dart';
import 'package:oat/screens/home_screen.dart';

void main() {
  runApp(OATApp());
}

class OATApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OAT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
