import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:gooritabasecode/app/routes/app_pages.dart';
import 'package:gooritabasecode/app/services/AuthenticationService.dart';

class AuthenticatedMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    final authService = Get.find<AuthenticationService>();

    return authService.isLogged.value
        ? null
        : RouteSettings(name: Routes.LOGIN);
  }
}
