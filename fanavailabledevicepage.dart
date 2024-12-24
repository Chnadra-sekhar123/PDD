import 'package:flutter/material.dart';
import 'fanselectdevicepage.dart'; // Import SelectDevicesPage
import 'fanconfigurationpage.dart'; // Import FanConfigurationPage

class FanAvailableDevicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF90A4AE), // Background color matching the design
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title Section
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                'AVAILABLE\nDEVICES',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            // Subheading Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Select the existing device to connect',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ),

            // Device Buttons
            Expanded(
              child: ListView(
                children: [
                  buildDeviceButton('ATOM BERG SMART FAN', context),
                  buildDeviceButton('HAVELLS SMART FAN', context),
                  buildDeviceButton('CROMPTON SMART FAN', context),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigate to SelectDevicesPage
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SelectDevicesPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF546E7A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            child: const Text(
                              'Add other devices',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        CircleAvatar(
                          backgroundColor: const Color(0xFF546E7A),
                          radius: 25,
                          child: IconButton(
                            onPressed: () {
                              // Navigate to SelectDevicesPage
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SelectDevicesPage(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Back Button
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
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

  // Function to create device buttons and navigate to FanConfigurationPage
  Widget buildDeviceButton(String label, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          // Navigate to FanConfigurationPage when a device is selected
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FanConfigurationPage(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF546E7A), // Matching button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
