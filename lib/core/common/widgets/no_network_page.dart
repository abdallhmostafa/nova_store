import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nova_store/core/styles/assets/app_json_assets.dart';

class NoNetworkPage extends StatelessWidget {
  const NoNetworkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Center(
          child: Lottie.asset(AppJsonAssets.noInternet_1),
        ),
      ),
    );
  }
}
