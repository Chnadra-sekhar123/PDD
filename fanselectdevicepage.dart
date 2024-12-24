import 'package:flutter/material.dart';
import 'fanconfigurationpage.dart'; // Import FanConfigurationPage

class SelectDevicesPage extends StatelessWidget {
  const SelectDevicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF90A4AE), // Light grey background
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Title Section
            const Center(
              child: Text(
                'SELECT DEVICES',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 5),
            // Divider Line (Optional design detail)
            const Center(
              child: SizedBox(
                width: 150,
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // "ALL" Section
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ALL',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Devices Grid
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(16),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: const [
                  DeviceButton(deviceName: 'TCL'),
                  DeviceButton(deviceName: 'Walton'),
                  DeviceButton(deviceName: 'Philips'),
                  DeviceButton(deviceName: 'Midea'),
                  DeviceButton(deviceName: 'Lianchuang'),
                  DeviceButton(deviceName: 'Haier'),
                  DeviceButton(deviceName: 'Chigo'),
                  DeviceButton(deviceName: 'Alpha'),
                ],
              ),
            ),
            // Back Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Navigates back to previous page
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.arrow_back, color: Colors.black),
                    SizedBox(width: 5),
                    Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeviceButton extends StatelessWidget {
  final String deviceName;

  const DeviceButton({
    required this.deviceName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to FanConfigurationPage when device is selected
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FanConfigurationPage(),
          ),
        );
        print('$deviceName selected');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            const Color(0xFF607D8B), // Darker grey color for buttons
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
      ),
      child: Text(
        deviceName,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
