import 'package:flutter/material.dart';
import 'choosedevicepage.dart';

class FindDevicePage extends StatelessWidget {
  const FindDevicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF90A4AE), // Background color updated to #90A4AE
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'FIND YOUR DEVICE',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Please connect your device to the same Wi-Fi network as your phone.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navigate to ChooseDevicePage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChooseDevicePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(40),
                backgroundColor: const Color.fromARGB(255, 163, 161, 172),
              ),
              child: const Text(
                '+',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'No available devices',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Show a loading dialog
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return const Center(
                      child: CircularProgressIndicator(), // Loading spinner
                    );
                  },
                );

                // Simulate a 3-second delay
                await Future.delayed(const Duration(seconds: 3));

                // Close the loading dialog
                Navigator.pop(context);

                // Reload the current page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FindDevicePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text('Retry'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the previous page
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                backgroundColor: Colors.black, // Button background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rectangular shape
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.arrow_back, // Inverted arrow icon
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
