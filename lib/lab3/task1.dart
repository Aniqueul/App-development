import 'package:flutter/material.dart';

void main() {
  runApp(WidgetApp());
}

class WidgetApp extends StatelessWidget {
  const WidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Widget App")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display Image at the top
          Image.asset(
            'assets/Screenshot 2025-03-12 215825.png',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),

          SizedBox(height: 20),

          // Row with icons and text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(Icons.star, color: Colors.blue, size: 40),
                  Text("Star", style: TextStyle(fontSize: 18)),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.favorite, color: Colors.red, size: 40),
                  Text("Favorite", style: TextStyle(fontSize: 18)),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.thumb_up, color: Colors.green, size: 40),
                  Text("Like", style: TextStyle(fontSize: 18)),
                ],
              ),
            ],
          ),

          SizedBox(height: 30),

          // Elevated Button at the bottom
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Button Pressed!")),
              );
            },
            child: Text("Press Me"),
          ),
        ],
      ),
    );
  }
}
