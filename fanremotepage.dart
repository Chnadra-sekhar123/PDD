import 'dart:async';
import 'package:flutter/material.dart';
import 'fanlockscreenpage.dart';
import 'choosedevicepage.dart'; // Import ChooseDevicePage

class FanRemotePage extends StatefulWidget {
  const FanRemotePage({Key? key}) : super(key: key);

  @override
  _FanRemotePageState createState() => _FanRemotePageState();
}

class _FanRemotePageState extends State<FanRemotePage> {
  Timer? _inactivityTimer;
  int _tapCount = 0;

  @override
  void initState() {
    super.initState();
    _startInactivityTimer();
  }

  @override
  void dispose() {
    _inactivityTimer?.cancel();
    super.dispose();
  }

  void _startInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(minutes: 5), () {
      _navigateToLockScreen();
    });
  }

  void _navigateToLockScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FanRemoteLockScreen()),
    );
  }

  void _handleTap() {
    _tapCount++;
    if (_tapCount == 3) {
      _tapCount = 0; // Reset the count after navigating
      _navigateToLockScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _handleTap(); // Handle triple tap
        _startInactivityTimer(); // Reset the inactivity timer on tap
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChooseDevicePage()),
              );
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Smart FAN Remote',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(width: 48), // Space to center title
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Big Power Button
              SizedBox(
                width: 100,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement power button functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.grey[300],
                  ),
                  child: const Icon(Icons.power_settings_new,
                      size: 50, color: Colors.black),
                ),
              ),
              const SizedBox(height: 40),
              // Fan Speed Circle with Numbers Below
              Column(
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement fan speed functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                        backgroundColor: Colors.grey[300],
                      ),
                      child: const Text(
                        'FAN SPEED',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNumber('1'),
                      _buildNumber('2'),
                      _buildNumber('3'),
                      _buildNumber('4'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildFunctionButton('Timer'),
                  _buildFunctionButton('Fan Mode'),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChooseDevicePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.grey[300],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.arrow_back, color: Colors.black),
                    SizedBox(width: 10),
                    Text(
                      'Back',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFunctionButton(String label) {
    return ElevatedButton(
      onPressed: () {
        // Implement function button functionality here
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        backgroundColor: Colors.grey[300],
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }

  Widget _buildNumber(String number) {
    return Text(
      number,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
