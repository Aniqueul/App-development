import 'dart:io';

import 'package:flutter/material.dart';

void main() {
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
            'Hello, My Name is Anique!', // Replace [Your Name] with your actual name
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
