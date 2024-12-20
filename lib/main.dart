import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store/core/app/app_bloc_observer.dart';
import 'package:nova_store/core/app/env.variables.dart';
import 'package:nova_store/nove_store.dart';

void main() async {
  await setup();
  runApp(const NovaStore());
}

// this function is used to initialize the app before running it
Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Future.wait([
    EnvVariable.instance.init(env: EnvTypeEnum.dev),
    Firebase.initializeApp(),
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    ),
  ]);
}
