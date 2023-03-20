import 'package:get/get.dart';
import 'package:gooritabasecode/app/routes/app_pages.dart';
import 'package:gooritabasecode/app/services/AuthenticationService.dart';

class HomeController extends GetxController {
  final authService = Get.find<AuthenticationService>();

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void logout() async {
    Get.snackbar('Logout', 'Logout successfully');
    authService.logOut();
    Get.offNamed(Routes.LOGIN);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
