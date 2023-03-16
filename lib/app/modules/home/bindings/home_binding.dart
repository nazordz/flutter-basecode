import 'package:get/get.dart';

import 'package:gooritabasecode/app/modules/home/controllers/authentication_manager_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationManagerController>(
      () => AuthenticationManagerController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
