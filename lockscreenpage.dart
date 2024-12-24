import 'package:flutter/material.dart';

class LockScreenRemote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                  'Nov 4, Mon',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
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
                  Text(
                    'Adjust settings in lock screen',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.volume_down, color: Colors.blue),
                      SizedBox(width: 10),
                      Expanded(
                        child: Slider(
                          value: 50,
                          max: 100,
                          min: 0,
                          onChanged: (value) {},
                          activeColor: Colors.blue,
                          inactiveColor: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.volume_up, color: Colors.blue),
                    ],
                  ),
                  SizedBox(height: 20),
                  GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    shrinkWrap: true,
                    children: [
                      buildStreamingButton('Hotstar', Colors.green),
                      buildStreamingButton('Netflix', Colors.red),
                      buildStreamingButton('Local', Colors.grey),
                      buildStreamingButton('YouTube', Colors.white,
                          textColor: Colors.black),
                      buildStreamingButton('Prime', Colors.blue),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.red,
                child: Icon(Icons.power_settings_new, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStreamingButton(String label, Color backgroundColor,
      {Color textColor = Colors.white}) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        minimumSize: Size(80, 50),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      ),
      child: FittedBox(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
