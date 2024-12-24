import 'package:flutter/material.dart';
import 'powerpage.dart'; // Import the PowerPage file

class CheckingConfigurationPage1 extends StatelessWidget {
  const CheckingConfigurationPage1({Key? key}) : super(key: key);

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
                'Add TV Remote',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Point the remote at the TV and tap the button.\nMake sure the TV responds.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Checking available configuration 1/3',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  // Navigate to PowerPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PowerPage(),
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the previous page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
