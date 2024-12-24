import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeviceInfoPage extends StatelessWidget {
  final TextEditingController typeController =
      TextEditingController(text: "Smart TV");
  final TextEditingController brandController = TextEditingController();
  final TextEditingController modelController = TextEditingController();

  Future<void> submitRequest(BuildContext context) async {
    if (brandController.text.isEmpty || modelController.text.isEmpty) {
      // Show a popup if any field is empty
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Missing Information'),
          content: const Text(
              'Please enter both the brand and model of the device.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    try {
      final Map<String, String> requestData = {
        'type': typeController.text,
        'brand': brandController.text,
        'model': modelController.text,
      };

      final response = await http.post(
        Uri.parse('http://localhost/remoteapp/device_api.php'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(requestData),
      );

      final responseData = json.decode(response.body);

      if (responseData['status'] == 'success') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RequestSubmitPage(),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(responseData['message'] ?? 'An error occurred.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Network Error'),
          content: const Text('Failed to connect to the server.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Device Info"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.sentiment_dissatisfied,
                size: 100,
                color: Colors.grey,
              ),
              const SizedBox(height: 16),
              const Text(
                "Couldn't get the device info",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                "Can't pair the device",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                "Send us details about this device\nso that we can support it later on",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
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
                      decoration: const InputDecoration(
                        labelText: "Type",
                        border: InputBorder.none,
                      ),
                    ),
                    const Divider(),
                    TextField(
                      controller: brandController,
                      decoration: const InputDecoration(
                        labelText: "Brand",
                        hintText: "Enter device name",
                        border: InputBorder.none,
                      ),
                    ),
                    const Divider(),
                    TextField(
                      controller: modelController,
                      decoration: const InputDecoration(
                        labelText: "Model",
                        hintText: "Enter device model",
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => submitRequest(context),
                child: const Text("Submit"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RequestSubmitPage extends StatelessWidget {
  const RequestSubmitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request Submitted"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100,
              ),
              const SizedBox(height: 24),
              const Text(
                "Request Submitted Successfully!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                "Our team will review the details and\nadd support for this device soon.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text("Go Back to Home"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
