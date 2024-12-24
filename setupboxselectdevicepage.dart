import 'package:flutter/material.dart';
import 'setupboxconfigurationpage.dart'; // Import the SetupBoxConfigurationPage

class SelectDevicesPage extends StatelessWidget {
  const SelectDevicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF90A4AE), // Background color from the screenshot
      body: Column(
        children: [
          const SizedBox(height: 40),
          // Title
          const Center(
            child: Text(
              "SELECT DEVICES",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 4),
          // Underline
          Container(
            height: 2,
            width: 100,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          // "ALL" label
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "ALL",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Devices grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildDeviceButton(context, "ACT Digital"),
                  _buildDeviceButton(context, "Dish TV"),
                  _buildDeviceButton(context, "Siti Cable"),
                  _buildDeviceButton(context, "Siti Digital"),
                  _buildDeviceButton(context, "Tata sky"),
                  _buildDeviceButton(context, "V4 Media"),
                  _buildDeviceButton(context, "You Scod"),
                  _buildDeviceButton(context, "Zippy Tel"),
                ],
              ),
            ),
          ),
          // Back button in the bottom middle
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(
                  vertical: 12, horizontal: 32), // Adjusted padding
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
    );
  }

  // Helper method to create a device button and navigate to the SetupBoxConfigurationPage
  Widget _buildDeviceButton(BuildContext context, String deviceName) {
    return GestureDetector(
      onTap: () {
        // Navigate to the SetupBoxConfigurationPage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SetupBoxConfigurationPage(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF78909C), // Button color
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            deviceName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
