import 'package:flutter/material.dart';
import 'package:nova_store/home_page.dart';

class NovaStore extends StatelessWidget {
  const NovaStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nova Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
