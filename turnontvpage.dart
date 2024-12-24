import 'package:flutter/material.dart';

class TurnOnTVPage extends StatelessWidget {
  const TurnOnTVPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB0B7C3),
      appBar: AppBar(
        title: const Text('Please Turn On TV'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: const Text(
          'Please! Turn On TV',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ),
      // Add the Floating Action Button for navigation back
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
            bottom: 20.0), // Adjust padding to position the button
        child: FloatingActionButton(
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.pop(context);
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerFloat, // Position the button at the bottom center
    );
  }
}
