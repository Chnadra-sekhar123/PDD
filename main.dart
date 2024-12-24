import 'package:flutter/material.dart';
import 'finddevicepage.dart'; // Ensure this file exists in the 'lib' folder

void main() {
  runApp(SmartRemoteApp());
}

class SmartRemoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SmartRemotePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SmartRemotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFA2A6B3), Color(0xFF1E1E1E)],
            stops: [0.5, 0.5],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top text "Smart Remote"
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Text(
                'Smart Remote',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Center circle stack
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 500,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 160, 167, 180),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xFF5A6B79),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFF38454F),
                    shape: BoxShape.circle,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FindDevicePage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Color(0xFF1E1E1E),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Bottom text "CONNECT YOUR DEVICE"
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Text(
                'CONNECT YOUR DEVICE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
