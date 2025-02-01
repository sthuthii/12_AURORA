
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth UI',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: () {},
                child: Text("Login", style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: Text("Don't have an account? Sign up"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign Up", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: () {},
                child: Text("Sign Up", style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Already have an account? Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
