import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Name App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Name App'),
        ),
        body: Center(
          child: Text(
            'Hello, My Name is Nouman!', // Replace [Your Name] with your actual name
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}