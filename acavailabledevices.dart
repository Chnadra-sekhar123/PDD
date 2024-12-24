import 'package:flutter/material.dart';
import 'acselectdevicepage.dart'; // Ensure this file exists
import 'acconfigurationpage.dart'; // Ensure this file exists

class ACAvailableDevicePage extends StatelessWidget {
  const ACAvailableDevicePage({Key? key}) : super(key: key);

  @override  
  Widget build(BuildContext context) {   
    final devices = [
      "BLUE STAR",
      "LG",
      "SAMSUNG",
      "GODREJ",
      "VOLTA",
      "CARRIER",
      "PANASONIC",
      "LIFE",
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF90A4AE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "AVAILABLE DEVICES",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                "Select the existing device to connect",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        4, // Adjust this dynamically for responsiveness if needed
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemCount: devices.length,
                  itemBuilder: (context, index) {
                    return _buildDeviceButton(context, devices[index]);
                  },
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DeviceSelectionPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF607D8B),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Add More Devices",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.arrow_back, color: Colors.white, size: 16),
                      SizedBox(width: 8),
                      Text(
                        "Back",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeviceButton(BuildContext context, String label) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ACConfigurationPage(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF607D8B),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
