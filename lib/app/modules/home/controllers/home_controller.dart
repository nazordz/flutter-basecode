import 'package:get/get.dart';
import 'package:gooritabasecode/app/modules/home/controllers/authentication_manager_controller.dart';
import 'package:gooritabasecode/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final AuthenticationManagerController authManager = Get.find();

  void logout() async {
    Get.snackbar('Logout', 'Logout successfully');
    authManager.logOut();
    Get.offNamed(Routes.LOGIN);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    // var loginStatus = await authManager.checkLoginStatus();
    // print(loginStatus);
    // print(authManager.isLogged.value);
    // if (!authManager.isLogged.value) {
    //   Get.offNamed(Routes.LOGIN);
    // }
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
