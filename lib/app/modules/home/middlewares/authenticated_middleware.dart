import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:gooritabasecode/app/modules/home/controllers/authentication_manager_controller.dart';
import 'package:gooritabasecode/app/routes/app_pages.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthenticatedMiddleware extends GetMiddleware {
  final authController = Get.find<AuthenticationManagerController>();

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    return authController.isLogged.value || route == Routes.LOGIN
        ? null
        : RouteSettings(name: Routes.HOME);
  }

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    var token = await authController.getToken();
    if (token != null) {
      bool hasExpired = JwtDecoder.isExpired(token);
      if (hasExpired) {
        authController.logOut();
        Get.offAllNamed(Routes.LOGIN);
      }
    }

    return super.redirectDelegate(route);
  }
}
