import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technocare_app/presentation/login_screen/widgets/login_widgets.dart';
import '../account_page/controller/account_controller.dart';
import 'controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AccountController authController = Get.put(AccountController());
  final LoginController loginController = Get.put(LoginController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF7c4c9d), Color(0xFFe3a446)
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginScreenWidgets.buildLogoSection(),
                const SizedBox(height: 40),

                LoginScreenWidgets.buildLoginForm(
                  emailController,
                  passwordController,
                ),
                const SizedBox(height: 20),

                LoginScreenWidgets.buildForgotPassword(),
                const SizedBox(height: 30),

                LoginScreenWidgets.buildLoginButton(() {
                  loginController.handleLogin(
                    emailController,
                    passwordController,
                  );
                }),
                const SizedBox(height: 30),

                LoginScreenWidgets.buildSignUpSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
