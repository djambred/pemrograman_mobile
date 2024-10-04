import 'package:flutter/material.dart';
import '../../presentation/pages/secondpage.dart';

void navigateToSecondPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SecondPage(),
    ),
  );
}
