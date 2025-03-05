import 'dart:io';

void main() {
  print('Welcome to the Age Calculator!');

  // Ask the user for their age
  stdout.write('Please enter your age: ');
  String? input = stdin.readLineSync();

  // Use null safety to handle empty input
  if (input == null || input.isEmpty) {
    print('Error: You did not enter anything. Please try again.');
    return;
  }

  // Try to parse the input as an integer
  try {
    int age = int.parse(input);

    // Validate the age
    if (age < 0) {
      print('Error: Age cannot be negative. Please enter a valid age.');
    } else if (age >= 100) {
      print('You are already 100 or older! Congratulations! 🎉');
    } else {
      int yearsLeft = 100 - age;
      print('You have $yearsLeft years left until you turn 100!');
    }
  } catch (e) {
    // Handle exceptions (e.g., non-numeric input)
    print('Error: "$input" is not a valid age. Please enter a number.');
  }
}