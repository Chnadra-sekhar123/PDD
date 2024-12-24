import 'package:flutter/material.dart';
import 'fanremotepage.dart';

class FanRemotePairedPage extends StatelessWidget {
  const FanRemotePairedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Delay navigation to FanRemotePage after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FanRemotePage()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
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
