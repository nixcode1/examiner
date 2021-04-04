import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorHandler {
  static void showError(String message) {
    return Get.snackbar("Error", message, backgroundColor: Colors.red);
  }
}