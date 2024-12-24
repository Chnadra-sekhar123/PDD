import 'package:flutter/material.dart';
import 'availabledevicepage.dart'; // For Smart TVs
import 'fanavailabledevicepage.dart'; // For Smart Fans
import 'acavailabledevices.dart'; // For AC navigation
import 'setupboxavailabledevicepage.dart'; // For Setup Box

class ChooseDevicePage extends StatelessWidget {
  const ChooseDevicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF90A4AE), // Background color #90A4AE
      body: Column(
        children: [
          const SizedBox(height: 60),
          const Center(
            child: Text(
              'Choose the device to connect',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DeviceButton(
                        deviceName: 'Smart TV',
                        deviceImage: 'images/smart_tv.png',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AvailableDevicesPage(),
                            ),
                          );
                        },
                      ),
                      DeviceButton(
                        deviceName: 'Smart Fans',
                        deviceImage: 'images/smart_fans.png',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FanAvailableDevicesPage(), // Should have `const` for consistency
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DeviceButton(
                        deviceName: 'AC',
                        deviceImage: 'images/ac.png',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ACAvailableDevicePage(),
                            ),
                          );
                        },
                      ),
                      DeviceButton(
                        deviceName: 'Setup Box',
                        deviceImage: 'images/setup_box.png',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SetupBoxAvailableDevicePage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.pop(context); // Returns to the previous screen
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_back, color: Colors.white, size: 16),
                  SizedBox(width: 4),
                  Text(
                    'Back',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class DeviceButton extends StatelessWidget {
  final String deviceName;
  final String deviceImage;
  final VoidCallback onTap;

  const DeviceButton({
    required this.deviceName,
    required this.deviceImage,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[200], // Circle color for the button
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              deviceImage,
              fit: BoxFit.contain, // Prevents distortion
            ),
          ),
          const SizedBox(height: 10),
          Text(
            deviceName,
            style: const TextStyle(
              color: Color.fromARGB(255, 219, 195, 195), // Updated text color
            ),
          ),
        ],
      ),
    );
  }
}
