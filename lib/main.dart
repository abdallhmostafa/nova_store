import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nova_store/core/app/env.variables.dart';
import 'package:nova_store/nove_store.dart';

void main() async {
  await setup();
  runApp(const NovaStore());
}

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    EnvVariable.instance.init(env: EnvTypeEnum.dev),
    Firebase.initializeApp(),
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    ),
  ]);
}
