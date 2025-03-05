import 'dart:async';

void main() async {
  print('Fetching weather data...');

  try {
    // Simulate fetching weather data
    String weatherData = await fetchWeatherData();
    print('Weather Data: $weatherData');
  } catch (e) {
    // Handle errors
    print('Error: $e');
  } finally {
    print('Weather data fetch attempt completed.');
  }
}

// Simulate an API call to fetch weather data
Future<String> fetchWeatherData() async {
  // Simulate a 3-second delay to mimic network latency
  await Future.delayed(Duration(seconds: 3));

  // Simulate a successful response or an error
  bool isSuccess = true; // Change to false to simulate an error

  if (isSuccess) {
    return 'Sunny, 25°C'; // Simulated weather data
  } else {
    throw Exception('Failed to fetch weather data'); // Simulated error
  }
}