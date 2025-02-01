import 'package:flutter/material.dart';
import 'congrats.dart'; // Import the new page
import 'button.dart'; // Import the button.dart page (CameraAndOCRScreen)

class UserDetailsPage extends StatefulWidget {
  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final TextEditingController ageController = TextEditingController();
  String? healthCondition;
  String? goal;
  String? dietPreference;

  final _formKey = GlobalKey<FormState>(); // Form key for validation

  void _submitDetails() {
    if (_formKey.currentState!.validate()) {
      if (healthCondition == null || goal == null || dietPreference == null) {
        _showMessage("Please select all options!");
        return;
      }

      _showMessage("Details submitted successfully!");

      // Navigate to Congratulations Page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CongratulationsPage()), // Navigate to CongratulationsPage
      );
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, textAlign: TextAlign.center)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("User Details", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),

                // Age Field
                TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Age", border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your age";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),

                // Health Condition Dropdown
                DropdownButtonFormField<String>(
                  value: healthCondition,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  hint: Text("Select Health Condition"),
                  items: ["Diabetic", "Blood Pressure"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      healthCondition = newValue;
                    });
                  },
                  validator: (value) => value == null ? "Please select a health condition" : null,
                ),
                SizedBox(height: 15),

                // Goal Dropdown
                DropdownButtonFormField<String>(
                  value: goal,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  hint: Text("Select Your Goal"),
                  items: ["Lose Weight", "Gain Weight", "Healthy Lifestyle", "Others"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      goal = newValue;
                    });
                  },
                  validator: (value) => value == null ? "Please select a goal" : null,
                ),
                SizedBox(height: 15),

                // Diet Preference Dropdown
                DropdownButtonFormField<String>(
                  value: dietPreference,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  hint: Text("Select Diet Preference"),
                  items: ["Vegetarian", "Non-Vegetarian"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      dietPreference = newValue;
                    });
                  },
                  validator: (value) => value == null ? "Please select a diet preference" : null,
                ),
                SizedBox(height: 20),

                // Submit Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  onPressed: _submitDetails,
                  child: Text("Submit", style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
