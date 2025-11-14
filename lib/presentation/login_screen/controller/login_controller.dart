import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../account_page/controller/account_controller.dart';
import '../../account_page/model/account_model.dart';

class LoginController extends GetxController {
  final AccountController authController = Get.find<AccountController>();

  void handleLogin(
      TextEditingController emailController,
      TextEditingController passwordController) {

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter email and password',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Simulated Login
    authController.login(
      UserProfile(
        name: 'John Doe',
        email: email,
        phone: '+1 (555) 123-4567',
        joinDate: 'March 15, 2024',
        profileImage: 'https://example.com/profile.jpg',
      ),
    );

    Get.back();
    Get.snackbar(
      'Success',
      'Logged in successfully!',
      backgroundColor: Colors.grey.shade300,
      colorText: Colors.black,
    );
  }
}
