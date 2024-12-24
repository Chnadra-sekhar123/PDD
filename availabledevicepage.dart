import 'package:flutter/material.dart';
import 'selectdevicepage.dart'; // Import SelectDevicePage
import 'addingtvremotepage.dart'; // Import AddingTVRemotePage

class AvailableDevicesPage extends StatelessWidget {
  const AvailableDevicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> devices = [
      'SONY TV',
      'ONE PLUS',
      'LG TV',
      'SAMSUNG',
      'REDMI TV',
      'REALME TV',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFB0BEC5), // Light blue background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    'AVAILABLE\nDEVICES',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Select the existing device to connect',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two buttons per row
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 2.5, // Adjust the button shape
                  ),
                  itemCount: devices.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      onPressed: () {
                        // Navigate to AddingTVRemotePage when a device is selected
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddingTVRemotePage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF546E7A), // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text(
                        devices[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to SelectDevicePage when Add other devices is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SelectDevicePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF546E7A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      minimumSize:
                          const Size(double.infinity, 50), // Full-width button
                      elevation: 0,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add other devices',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.add, color: Colors.white),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Go back
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.arrow_back, color: Colors.black),
                        SizedBox(width: 10),
                        Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
