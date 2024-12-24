import 'package:flutter/material.dart';
import 'acconfigurationpage.dart'; // Import the ACConfigurationPage

class DeviceSelectionPage extends StatelessWidget {
  const DeviceSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF90A4AE), // Background color
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            // Title Section
            const Center(
              child: Text(
                "SELECT DEVICES",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Divider(
                color: Colors.white,
                thickness: 1.5,
                indent: 100,
                endIndent: 100,
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "ALL",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 8),
            // Device Buttons Section
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // Two columns
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                padding: const EdgeInsets.all(16),
                children: [
                  _buildDeviceButton(context, "ACL"),
                  _buildDeviceButton(context, "Apton"),
                  _buildDeviceButton(context, "Lloyd"),
                  _buildDeviceButton(context, "Croma"),
                  _buildDeviceButton(context, "Godrej"),
                  _buildDeviceButton(context, "Hitech"),
                  _buildDeviceButton(context, "TCL"),
                  _buildDeviceButton(context, "Philips"),
                ],
              ),
            ),
            const Spacer(),
            // Back Button Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.black, // Black box
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.arrow_back, color: Colors.white, size: 16),
                        SizedBox(width: 8),
                        Text(
                          "Back",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceButton(BuildContext context, String label) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to ACConfigurationPage when device button is pressed
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ACConfigurationPage(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF607D8B), // Button color
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
