import 'package:flutter/material.dart';
import 'package:ingredify/button.dart';
import 'button.dart'; // Import the button.dart page

class CongratulationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Congratulations!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              SizedBox(height: 20),
              Text(
                "You've successfully submitted your details.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.green),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),

              // Next Button to navigate to Camera and OCR page (button.dart)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  // Navigate to CameraAndOCRScreen (button.dart)
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => CameraAndOCRScreen()),
                  );
                },
                child: Text("Next", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
