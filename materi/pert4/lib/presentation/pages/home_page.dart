import 'package:flutter/material.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  HomePage(this.controller);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent:
          Center(child: Text('Home Page')), // Home page specific content
      selectedIndex: 0, // Home tab is selected
      controller: controller,
    );
  }
}
