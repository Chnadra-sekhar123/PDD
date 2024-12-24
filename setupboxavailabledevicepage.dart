import 'package:flutter/material.dart';
import 'setupboxselectdevicepage.dart'; // Import the next page
import 'setupboxconfigurationpage.dart'; // Import the SetupBoxConfigurationPage

class SetupBoxAvailableDevicePage extends StatelessWidget {
  const SetupBoxAvailableDevicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF90A4AE), // Background color #90A4AE
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title
            const Text(
              "SETUP BOX DEVICES",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // Subtitle
            const Text(
              "Select a Setup Box to connect",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            // Device Buttons
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDeviceButton("AIRTEL DIGITAL", context),
                  const SizedBox(height: 16),
                  _buildDeviceButton("TATA PLAY", context),
                  const SizedBox(height: 16),
                  _buildDeviceButton("DISH TV", context),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Navigate to SetupBoxSelectDevicePage
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SelectDevicesPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Add other devices",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      FloatingActionButton(
                        onPressed: () {
                          // Navigate to SetupBoxSelectDevicePage
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SelectDevicesPage(),
                            ),
                          );
                        },
                        backgroundColor: const Color(0xFF78909C),
                        child: const Icon(Icons.add, color: Colors.white),
                        mini: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Back Button in bottom center
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 12, horizontal: 32), // Adjusted padding
                color: Colors.black,
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  label: const Text(
                    "Back",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Helper function to create a device button
  Widget _buildDeviceButton(String title, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to SetupBoxConfigurationPage when a device is selected
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SetupBoxConfigurationPage(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF78909C), // Button color
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
