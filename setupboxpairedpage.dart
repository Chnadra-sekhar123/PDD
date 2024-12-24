import 'package:flutter/material.dart';
import 'dart:async'; // Import for delay functionality

import 'setupboxremotecontrolpage.dart'; // Import the RemoteControlPage

class PairedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Navigate to RemoteControlPage after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RemoteControlPage()),
      );
    });

    return Scaffold(
      body: Center(
        child: Container(
          width: 150, // Adjust the width as needed
          height: 150, // Adjust the height as needed
          decoration: BoxDecoration(
            color: Colors.green, // Match the green shade from the image
            shape: BoxShape.circle, // Makes the container circular
          ),
          child: Center(
            child: Text(
              'Paired',
              style: TextStyle(
                fontSize: 18, // Adjust font size as needed
                color: Colors.black, // Text color
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PairedPage(),
  ));
}
