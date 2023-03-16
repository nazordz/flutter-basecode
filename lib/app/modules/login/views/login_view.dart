import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Form(
            key: controller.loginFormKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Logo-Goorita.jpg'),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: controller.mustEmail,
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: controller.validate,
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                    onPressed: () {
                      controller.login();
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50.h)),
                    child: const Text('Login'),
                  )
                ]),
          )),
    );
  }
}
