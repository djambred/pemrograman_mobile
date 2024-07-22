// lib/main.dart

import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import the login screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Strapi Login Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(), // Set the initial route to LoginScreen
    );
  }
}
