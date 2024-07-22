// lib/login_screen.dart

import 'package:flutter/material.dart';
import 'auth_service.dart'; // Import the auth service
import 'signup_screen.dart'; // Import the signup screen

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _message;

  void _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    final token = await loginUser(email, password);

    setState(() {
      if (token != null) {
        _message = 'Login successful! Token: $token';

        // Optionally, fetch protected data here
        fetchProtectedData();
      } else {
        _message = 'Login failed.';
      }
    });
  }

  void _insertData() async {
    // Replace with your data to insert
    await insertData('Sample Name', 'Sample Description');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _insertData,
              child: Text('Insert Data'),
            ),
            SizedBox(height: 20),
            if (_message != null)
              Text(
                _message!,
                style: TextStyle(
                  color: _message!.startsWith('Login successful')
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              child: Text('No account? Sign up here'),
            ),
          ],
        ),
      ),
    );
  }
}
