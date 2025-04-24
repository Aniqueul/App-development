import 'package:flutter/material.dart';

void main() {
  runApp(TimerApp());
}

class TimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer App',
      home: TimerScreen(),
    );
  }
}

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _seconds = 10;
  bool _isRunning = false;

  void _startTimer() async {
    if (_isRunning) return;

    setState(() {
      _isRunning = true;
    });

    for (int i = _seconds; i > 0; i--) {
      await Future.delayed(Duration(seconds: 1));
      if (!mounted) return;
      setState(() {
        _seconds--;
      });
    }

    setState(() {
      _isRunning = false;
      _seconds = 10; // reset timer
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_seconds',
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _startTimer,
              child: Text('Start Timer'),
            ),
          ],
        ),
      ),
    );
  }
}
