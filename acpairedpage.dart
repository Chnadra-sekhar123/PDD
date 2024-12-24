import 'dart:async';
import 'package:flutter/material.dart';
import 'acremotepage1.dart'; // Import the file where SmartACRemote (ACRemotePage1) is defined

class PairedPage extends StatefulWidget {
  @override
  _PairedPageState createState() => _PairedPageState();
}

class _PairedPageState extends State<PairedPage> {
  @override
  void initState() {
    super.initState();
    // Delay for 3 seconds and navigate to SmartACRemote
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SmartACRemote()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
