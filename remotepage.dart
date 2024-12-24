import 'package:flutter/material.dart';
import 'choosedevicepage.dart'; // Import ChooseDevicePage for back navigation
import 'lockscreenpage.dart'; // Import LockScreenRemote page

class SmartTvRemotePage extends StatefulWidget {
  const SmartTvRemotePage({Key? key}) : super(key: key);

  @override
  _SmartTvRemotePageState createState() => _SmartTvRemotePageState();
}

class _SmartTvRemotePageState extends State<SmartTvRemotePage> {
  int _tapCount = 0;

  @override
  void initState() {
    super.initState();

    // Schedule navigation to LockScreenRemote after a 5-minute delay
    Future.delayed(const Duration(minutes: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LockScreenRemote()),
      );
    });
  }

  void _handleTap() {
    setState(() {
      _tapCount += 1;
    });

    if (_tapCount == 3) {
      // Navigate to LockScreenRemote on triple tap
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LockScreenRemote()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate back to ChooseDevicePage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChooseDevicePage()),
        );
        return false; // Prevent default back navigation
      },
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: GestureDetector(
          onTap: _handleTap, // Handle taps for triple-click functionality
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      buildBackButton(context), // Back button
                      const SizedBox(width: 8),
                      const Text(
                        'Smart TV Remote',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 5,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Top row with Menu, Home, and Power buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildBoxedIcon(Icons.menu, () {}),
                            buildBoxedIcon(Icons.home, () {}),
                            buildBoxedIcon(Icons.power_settings_new, () {},
                                color: Colors.red),
                          ],
                        ),
                        // Circular directional pad with OK button
                        Column(
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[100],
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    top: 10,
                                    child: buildBoxedIcon(
                                        Icons.arrow_drop_up, () {}),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    child: buildBoxedIcon(
                                        Icons.arrow_drop_down, () {}),
                                  ),
                                  Positioned(
                                    left: 10,
                                    child:
                                        buildBoxedIcon(Icons.arrow_left, () {}),
                                  ),
                                  Positioned(
                                    right: 10,
                                    child: buildBoxedIcon(
                                        Icons.arrow_right, () {}),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.blueAccent,
                                      shape: const CircleBorder(),
                                    ),
                                    child: const Text(
                                      'OK',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Volume and channel controls
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "Volume",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                buildPlusMinusBox(
                                  onPlusPressed: () {},
                                  onMinusPressed: () {},
                                  label: "Vol",
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  "Channel",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                buildPlusMinusBox(
                                  onPlusPressed: () {},
                                  onMinusPressed: () {},
                                  label: "Ch",
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Streaming service buttons
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildBoxedButton('NETFLIX', Colors.red, () {}),
                                buildBoxedButton('PRIME', Colors.blue, () {}),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildBoxedButton('YOUTUBE', Colors.white, () {},
                                    textColor: Colors.black,
                                    borderColor: Colors.black),
                                buildBoxedButton(
                                    'HOTSTAR', Colors.green, () {}),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBackButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChooseDevicePage()),
          );
        },
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        label: const Text(
          'Back',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget buildBoxedIcon(IconData icon, VoidCallback onPressed,
      {Color color = Colors.black}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        color: color,
      ),
    );
  }

  Widget buildBoxedButton(
      String text, Color backgroundColor, VoidCallback onPressed,
      {Color textColor = Colors.white,
      Color borderColor = Colors.transparent}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          minimumSize: const Size(100, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }

  Widget buildPlusMinusBox({
    required VoidCallback onPlusPressed,
    required VoidCallback onMinusPressed,
    required String label,
  }) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        children: [
          IconButton(
            onPressed: onPlusPressed,
            icon: const Icon(Icons.add),
            iconSize: 20,
          ),
          Text(label, style: const TextStyle(fontSize: 14)),
          IconButton(
            onPressed: onMinusPressed,
            icon: const Icon(Icons.remove),
            iconSize: 20,
          ),
        ],
      ),
    );
  }
}
