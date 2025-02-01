import 'package:flutter/material.dart';
import 'singup.dart'; // Import the SignUpPage
import 'login.dart'; // Import LoginPage

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(), // Ensure this is the correct starting page
    routes: {
      '/signup': (context) => SignUpPage(),
    },
  ));
}
