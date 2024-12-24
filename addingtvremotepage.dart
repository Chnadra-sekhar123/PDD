import 'package:flutter/material.dart';
import 'turnontvpage.dart'; // Import TurnOnTVPage
import 'checkingconfigurationpage1.dart'; // Import CheckingConfigurationPage1

class AddingTVRemotePage extends StatefulWidget {
  const AddingTVRemotePage({Key? key}) : super(key: key);

  @override
  State<AddingTVRemotePage> createState() => _AddingTVRemotePageState();
}

class _AddingTVRemotePageState extends State<AddingTVRemotePage> {
  bool isTVOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA5B5BE),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Add TV Remote',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            // "Is TV on?" text
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Is TV on?',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            // TV illustration
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 200,
                  height: 150,
                  child: CustomPaint(
                    painter: TVPainter(),
                  ),
                ),
              ),
            ),
            // Bottom panel
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Is TV on?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildToggleButton('On', true, context),
                      _buildToggleButton('Off', false, context),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, bool value, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (value) {
          // Navigate to CheckingConfigurationPage1 if "On" is selected
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CheckingConfigurationPage1(),
            ),
          );
        } else {
          // Navigate to TurnOnTVPage if "Off" is selected
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TurnOnTVPage()),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isTVOn == value ? Colors.blue : Colors.grey[300],
        foregroundColor: isTVOn == value ? Colors.white : Colors.black,
        minimumSize: const Size(120, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(text),
    );
  }
}

// Custom painter for TV illustration
class TVPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint tvPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw TV
    final RRect tvFrame = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height * 0.8),
      const Radius.circular(10),
    );
    canvas.drawRRect(tvFrame, tvPaint);

    // Draw remote
    final Paint remotePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final double remoteWidth = size.width * 0.15;
    final double remoteHeight = size.height * 0.4;
    final double remoteX = size.width * 0.4;
    final double remoteY = size.height * 0.7;

    canvas.drawRect(
      Rect.fromLTWH(remoteX, remoteY, remoteWidth, remoteHeight),
      remotePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
