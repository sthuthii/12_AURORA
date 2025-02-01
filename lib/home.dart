import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(
        title: Text("Congratulations!"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "🎉 Congratulations! 🎉",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.green),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "You have successfully set up your profile and challenge!",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  // Navigate to next steps or dashboard
                },
                child: Text("Start Your Journey", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
