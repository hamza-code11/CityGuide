import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController {
  // Method to handle logout
  void logout() {
    // Optionally clear any session data or user info here
    // For example: await clearSession();

    // Redirect to the login screen after logout
    Get.offNamed('/login'); // Redirect to login screen and remove the current screen from the stack
  }
}
