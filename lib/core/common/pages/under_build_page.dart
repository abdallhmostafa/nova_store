import 'package:flutter/material.dart';

class UnderBuildPage extends StatelessWidget {
  const UnderBuildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Sorry, This page is under development',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
