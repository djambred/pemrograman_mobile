import 'package:flutter/material.dart';
import 'core/navigation_service.dart';
import 'presentation/pages/homepage.dart';
import 'presentation/pages/profilepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey, // Global navigation key
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/profile': (context) => ProfilePage(), // Named route for SecondPage
      },
    );
  }
}
