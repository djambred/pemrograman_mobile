import 'package:flutter/material.dart';
import '../../domain/usecases/navigate_to_second_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pertemuan 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Jungle'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Call use case to navigate to second page
                navigateToSecondPage(context);
              },
              child: Text('Go to Second Page'),
            ),
          ],
        ),
      ),
    );
  }
}
