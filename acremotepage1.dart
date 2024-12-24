import 'package:flutter/material.dart';
import 'choosedevicepage.dart'; // Import for ChooseDevicePage navigation

void main() {
  runApp(SmartACRemote());
}

class SmartACRemote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 40,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChooseDevicePage(),
                ),
              );
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                "Smart AC Remote",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 150,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 40),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30, // Spacing between rows
                  crossAxisSpacing: 30, // Spacing between columns
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    buildCustomBox("Speed"),
                    buildCustomBox("TEMP"),
                    buildCustomBox("Direction"),
                    buildCustomBox("Swing"),
                    buildButton("ON/OFF"),
                    buildArrowButtons(
                        "Swing H", Icons.arrow_back, Icons.arrow_forward),
                    buildButton("Timer"),
                    buildButton("Sleep"),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChooseDevicePage(),
                    ),
                  );
                },
                icon: Icon(Icons.arrow_back, color: Colors.black),
                label: Text(
                  "Back",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCustomBox(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_left, size: 30, color: Colors.black),
        ),
        SizedBox(width: 8), // Space between the arrow and box
        Container(
          alignment: Alignment.center,
          height: 50,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 8), // Space between the box and arrow
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_right, size: 30, color: Colors.black),
        ),
      ],
    );
  }

  Widget buildButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 20), // Adjusted button padding
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget buildArrowButtons(
      String label, IconData leftIcon, IconData rightIcon) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                // Logic for left arrow
              },
              icon: Icon(leftIcon, size: 30, color: Colors.black),
            ),
            SizedBox(width: 8),
            IconButton(
              onPressed: () {
                // Logic for right arrow
              },
              icon: Icon(rightIcon, size: 30, color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}
