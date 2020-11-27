import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          "Loading",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
