import 'package:flutter/material.dart';
import 'package:nova_store/core/constants/app_constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nova Store',
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome to Nova Store',
              style: TextStyle(
                fontFamily: AppConstant.arabicFontCairo,
              )),
          Text('Welcome to Nova Store',
              style: TextStyle(
                fontFamily: AppConstant.englishFontPoppins,
              )),
        ],
      ),
    );
  }
}
