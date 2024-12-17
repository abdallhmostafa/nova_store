import 'package:flutter/material.dart';
import 'package:nova_store/core/styles/assets/app_gif_assets.dart';

class UnderBuildPage extends StatelessWidget {
  const UnderBuildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                AppGifAssets.underDevelopment_1,
                fit: BoxFit.fill,
              ),
            ),
            const Expanded(
              child: Text(
                'Sorry, This page is under development',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
