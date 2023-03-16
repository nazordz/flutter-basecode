import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:gooritabasecode/app/modules/login/providers/login_provider.dart';
import 'package:gooritabasecode/app/routes/app_pages.dart';
import 'package:gooritabasecode/app/services/AuthenticationService.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final validate = ValidationBuilder().build();
  final mustEmail = ValidationBuilder().email().build();

  LoginProvider loginProvider;
  final authService = Get.find<AuthenticationService>();

  LoginController({required this.loginProvider});

  void login() async {
    try {
      if (loginFormKey.currentState!.validate()) {
        var result = await loginProvider.authenticate(
            emailController.text, passwordController.text);
        if (result != null) {
          await authService.login(result.bearerToken, result.refreshToken);
          // await authManager.login(result.bearerToken, result.refreshToken);
          Get.snackbar('Login', 'Login successfully');
          Get.offNamed(Routes.HOME);
        } else {
          Get.snackbar('Login', 'Invalid email or password');
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'can\'t save token');
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // emailController.dispose();
    // passwordController.dispose();
    super.onClose();
  }
}
