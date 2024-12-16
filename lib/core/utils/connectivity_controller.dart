import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityController {
  factory ConnectivityController() => instance;
  ConnectivityController._();
  static final ConnectivityController instance = ConnectivityController._();

  ValueNotifier<bool> isConnected = ValueNotifier<bool>(true);
  Future<void> init() async {
    final result = await Connectivity().checkConnectivity();
    isThereNetwork(result);
    Connectivity().onConnectivityChanged.listen(isThereNetwork);
  }

  bool isThereNetwork(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi)) {
      isConnected.value = true;
      return true;
    }

    isConnected.value = false;
    return false;
  }
}
