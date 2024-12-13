import 'package:flutter/material.dart';
import 'package:rgc_dynamics_machine_test/main.dart';

class SnackBarUtils {
  static void showMessage(String message) {
    App.scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
