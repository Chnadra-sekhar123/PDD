import 'package:flutter/material.dart';

// DeviceInfoPage class
class DeviceInfoPage extends StatelessWidget {
  // Controllers to prefill text in TextFields
  final TextEditingController typeController =
      TextEditingController(text: "Smart Fan");
  final TextEditingController brandController =
      TextEditingController(); // Make it editable now
  final TextEditingController modelController =
      TextEditingController(); // Leave it empty

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.sentiment_dissatisfied,
                size: 100,
                color: Colors.grey,
              ),
              SizedBox(height: 16),
              Text(
                "Couldn't get the device info",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                "Can't pair the device",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                "Send us details about this device\nso that we can support it later on",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: typeController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: "Type",
                        border: InputBorder.none,
                      ),
                    ),
                    Divider(),
                    TextField(
                      controller: brandController,
                      decoration: InputDecoration(
                        labelText: "Brand",
                        hintText:
                            "Enter device name", // Hint text for brand name
                        border: InputBorder.none,
                      ),
                    ),
                    Divider(),
                    TextField(
                      controller: modelController,
                      decoration: InputDecoration(
                        labelText: "Model",
                        hintText: "Enter device model",
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Print entered details
                  print("Type: ${typeController.text}");
                  print("Brand: ${brandController.text}");
                  print("Model: ${modelController.text}");
                  // Navigate to the RequestSubmittedPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RequestSubmittedPage(),
                    ),
                  );
                },
                child: Text("Submit"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// RequestSubmittedPage class
class RequestSubmittedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100,
              ),
              SizedBox(height: 24),
              Text(
                "Request Submitted Successfully!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                "Our team will review the details and\nadd support for this device soon.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Navigate back to the home or previous page
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Text("Back to Home"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
