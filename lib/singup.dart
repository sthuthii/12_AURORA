import 'package:flutter/material.dart';
import 'login.dart'; // Ensure this is the correct path to the LoginPage
import 'user_details_page.dart'; // Import User Details Page

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void _signUp() {
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showMessage("All fields are required!");
      print("Sign-up failed: Empty fields");
      return;
    }
    if (password != confirmPassword) {
      _showMessage("Passwords do not match!");
      print("Sign-up failed: Password mismatch");
      return;
    }

    print("Sign-up successful! Navigating to UserDetailsPage...");

    // Navigate to User Details Page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => UserDetailsPage()),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      body: Center(
        child: SingleChildScrollView( // <-- Fix: Make it scrollable if content overflows
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sign Up", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                // Username Field
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(labelText: "Username", border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                // Email Field
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                // Password Field
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                // Confirm Password Field
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Confirm Password", border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),
                // Sign-Up Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: _signUp,
                  child: Text("Sign Up", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 10), // Add spacing
                // Test Button to Manually Navigate to UserDetailsPage
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserDetailsPage()),
                    );
                  },
                  child: Text("Go to UserDetailsPage", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 10), // Add spacing
                // Navigate back to Login Page
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text("Already have an account? Login"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
