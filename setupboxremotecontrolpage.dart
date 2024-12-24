import 'package:flutter/material.dart';
import 'dart:async'; // For timer functionality
import 'setupboxlockscreenpage.dart';
import 'choosedevicepage.dart'; // Import ChooseDevicePage

class RemoteControlPage extends StatefulWidget {
  const RemoteControlPage({Key? key}) : super(key: key);

  @override
  _RemoteControlPageState createState() => _RemoteControlPageState();
}

class _RemoteControlPageState extends State<RemoteControlPage> {
  int _clickCount = 0;
  Timer? _inactiveTimer;

  @override
  void initState() {
    super.initState();
    _startInactivityTimer(); // Start the inactivity timer
  }

  @override
  void dispose() {
    _inactiveTimer?.cancel(); // Dispose the timer when the widget is removed
    super.dispose();
  }

  void _startInactivityTimer() {
    _inactiveTimer?.cancel(); // Cancel any existing timer
    _inactiveTimer = Timer(const Duration(minutes: 5), () {
      _navigateToLockScreen();
    });
  }

  void _navigateToLockScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LockScreenRemote()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300], // Matches the background color
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            _handleTap();
            _startInactivityTimer(); // Reset inactivity timer on tap
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Setup box TV Remote",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Top row of buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCircularButton(Icons.menu, Colors.white, Colors.black),
                  _buildCircularButton(Icons.home, Colors.black, Colors.white),
                  _buildCircularButton(
                      Icons.power_settings_new, Colors.red, Colors.white),
                ],
              ),
              const SizedBox(height: 50),
              // Navigation buttons
              Column(
                children: [
                  // Up Arrow
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_drop_up),
                    iconSize: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Left Arrow
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_left),
                        iconSize: 40,
                      ),
                      // OK Button
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        padding: const EdgeInsets.all(15),
                        child: const Text(
                          "OK",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Right Arrow
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_right),
                        iconSize: 40,
                      ),
                    ],
                  ),
                  // Down Arrow
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 40,
                  ),
                ],
              ),
              const SizedBox(height: 50),
              // Back and Cast Screen
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                    iconSize: 30,
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.cast),
                        iconSize: 40,
                      ),
                      const Text(
                        "Cast screen",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              // Volume and Channel Controls
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildVerticalControl("CH"),
                  _buildVerticalControl("VOL"),
                ],
              ),
              const Spacer(),
              // Back Button
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChooseDevicePage()),
                  );
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text("Back"),
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircularButton(
      IconData icon, Color backgroundColor, Color iconColor) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      padding: const EdgeInsets.all(15),
      child: Icon(
        icon,
        color: iconColor,
        size: 30,
      ),
    );
  }

  Widget _buildVerticalControl(String label) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(10),
          child: const Icon(Icons.add, size: 30),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(10),
          child: const Icon(Icons.remove, size: 30),
        ),
      ],
    );
  }

  // Handle tap for triple-click functionality
  void _handleTap() {
    _clickCount++;
    if (_clickCount == 3) {
      _navigateToLockScreen(); // Navigate to Lock Screen
    }
    // Reset after 1 second
    Future.delayed(const Duration(seconds: 3), () {
      _clickCount = 0;
    });
  }
}
