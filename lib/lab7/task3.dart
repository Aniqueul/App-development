import 'package:flutter/material.dart';

void main() {
  runApp(DatabaseSimulationApp());
}

class DatabaseSimulationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Async DB Simulation',
      home: DatabaseScreen(),
    );
  }
}

class DatabaseScreen extends StatefulWidget {
  @override
  _DatabaseScreenState createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  List<String>? data;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDataFromLocalDB();
  }

  Future<void> fetchDataFromLocalDB() async {
    await Future.delayed(Duration(seconds: 2)); // simulate delay

    // Simulated data as if fetched from a local database
    List<String> fetchedData = [
      'User 1: Alice',
      'User 2: Bob',
      'User 3: Charlie',
      'User 4: Diana',
      'User 5: Evan'
    ];

    setState(() {
      data = fetchedData;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,
          title: Text('Simulated DB Query')),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: data!.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(data![index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
