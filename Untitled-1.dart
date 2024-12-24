import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TV Remote Power Configuration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TVRemotePowerConfig(),
    );
  }
}

class TVRemotePowerConfig extends StatefulWidget {
  const TVRemotePowerConfig({Key? key}) : super(key: key);

  @override
  State<TVRemotePowerConfig> createState() => _TVRemotePowerConfigState();
}

class _TVRemotePowerConfigState extends State<TVRemotePowerConfig> {
  int currentConfig = 1;
  final int totalConfigs = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA5B5BE), // Bluish-grey background
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center the column
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),

                // Header
                const Text(
                  'Add TV Remote',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 24),

                // Instructions
                const Text(
                  'Point the remote at TV and tap the button.\nMake sure TV responds.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 16),

                // Configuration status
                Text(
                  'Checking available configuration $currentConfig/$totalConfigs',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                ),

                const SizedBox(height: 40),

                // Power button
                GestureDetector(
                  onTap: () {
                    // Handle power button tap
                    setState(() {
                      if (currentConfig < totalConfigs) {
                        currentConfig++;
                      }
                    });
                  },
                  child: CustomPaint(
                    painter: PowerButtonPainter(),
                    size: const Size(120, 120),
                  ),
                ),

                const SizedBox(height: 16),

                // Power text
                const Text(
                  'Power',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PowerButtonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint circlePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill; // Ensure it's filled

    final Paint symbolPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.08
      ..strokeCap = StrokeCap.round;

    // Draw the full red circle
    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, circlePaint); // Red full circle

    // Draw power symbol
    final double symbolRadius = size.width * 0.25;
    final double startY = size.height * 0.25;
    final double lineHeight = size.height * 0.3;

    // Draw the vertical line of the power symbol
    canvas.drawLine(
      Offset(center.dx, startY),
      Offset(center.dx, startY + lineHeight),
      symbolPaint,
    );

    // Draw the arc (the circle portion of the power symbol)
    final Path powerCircle = Path()
      ..addArc(
        Rect.fromCenter(
          center: center,
          width: symbolRadius * 2,
          height: symbolRadius * 2,
        ),
        -2.35619, // -135 degrees in radians
        4.71239, // 270 degrees in radians
      );

    canvas.drawPath(powerCircle, symbolPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
