import 'package:flutter/material.dart';

class FanRemoteLockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Time and Date Section
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Text(
                  '08:27',
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Nov 22, Wed',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            // Power Button and Speed Slider Section
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Instruction Text
                  Text(
                    'Adjust fan settings',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Power Button
                  ElevatedButton(
                    onPressed: () {
                      // Implement power button functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.grey[300],
                    ),
                    child: Icon(Icons.power_settings_new,
                        size: 50, color: Colors.black),
                  ),
                  SizedBox(height: 30),
                  // Fan Speed Adjustment
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.speed, color: Colors.blue),
                      SizedBox(width: 10),
                      Expanded(
                        child: Slider(
                          value: 2,
                          min: 1,
                          max: 4,
                          divisions: 3,
                          onChanged: (value) {
                            // Implement fan speed adjustment here
                          },
                          activeColor: Colors.blue,
                          inactiveColor: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '4',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Bottom Power Off Button
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: FloatingActionButton(
                onPressed: () {
                  // Implement bottom power off button functionality here
                },
                backgroundColor: Colors.red,
                child: Icon(Icons.power_settings_new, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
