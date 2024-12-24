import 'package:flutter/material.dart';
import 'remotepage.dart'; // Import the RemotePage

class PairedPage extends StatelessWidget {
  const PairedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Automatically navigate to the remote page after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SmartTvRemotePage()),
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
          child: const Center(
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
