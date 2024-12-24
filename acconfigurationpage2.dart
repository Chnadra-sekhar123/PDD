import 'package:flutter/material.dart';
import 'acpowerpage2.dart'; // Import the ACPowerPage2

class ACConfigurationPage extends StatelessWidget {
  const ACConfigurationPage({Key? key}) : super(key: key);

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
                'Add AC Remote',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Point the remote at the AC and tap the button.\nMake sure the AC responds.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Checking available configuration 2/2', // Updated "1" to "2"
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  // Navigate to ACPowerPage2 when the power icon is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ACPowerPage2(),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
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
