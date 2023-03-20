import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/homeScreen/bindings/home_screen_binding.dart';
import '../modules/home/homeScreen/views/home_screen_view.dart';
import '../modules/home/middlewares/authenticated_middleware.dart';
import '../modules/home/newsScreen/bindings/news_screen_binding.dart';
import '../modules/home/newsScreen/views/news_screen_view.dart';
import '../modules/home/profileScreen/bindings/profile_screen_binding.dart';
import '../modules/home/profileScreen/views/profile_screen_view.dart';
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
        ],
        children: [
          GetPage(
            name: _Paths.PROFILE_SCREEN,
            page: () => const ProfileScreenView(),
            binding: ProfileScreenBinding(),
          ),
          GetPage(
            name: _Paths.NEWS_SCREEN,
            page: () => const NewsScreenView(),
            binding: NewsScreenBinding(),
          ),
          GetPage(
            name: _Paths.HOME_SCREEN,
            page: () => const HomeScreenView(),
            binding: HomeScreenBinding(),
          ),
        ]),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
