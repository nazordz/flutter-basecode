import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/middlewares/authenticated_middleware.dart';
import '../modules/home/profile/bindings/profile_binding.dart';
import '../modules/home/profile/views/profile_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        middlewares: [
          AuthenticatedMiddleware(),
        ]),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      children: [
        GetPage(
          name: _Paths.PROFILE,
          page: () => const ProfileView(),
          binding: ProfileBinding(),
        ),
      ],
    ),
  ];
}
