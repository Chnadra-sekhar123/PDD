import 'package:flutter/material.dart';
import 'setupboxpowerpage.dart'; // Import SetupBoxPowerPage for navigation

class SetupBoxConfigurationPage extends StatelessWidget {
  const SetupBoxConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB0B7C3), // Light grey background
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Centers the column vertically
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Add Setup Box Remote',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Point the remote at the Setup Box and tap the button.\nMake sure the Setup Box responds.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Checking available configuration 1/1', // Updated "3" to "1"
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: GestureDetector(
                  onTap: () {
                    // Navigate to SetupBoxPowerPage when Power button is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SetupBoxPowerPage(),
                      ),
                    );
                  },
                  child: const Center(
                    child: Icon(
                      Icons.power_settings_new,
                      color: Colors.white,
                      size: 48,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Power',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
