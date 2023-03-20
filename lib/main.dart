import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gooritabasecode/app/services/AuthenticationService.dart';
import 'package:gooritabasecode/config/color_schemes.g.dart';
import 'package:gooritabasecode/config/theme.dart';

import 'app/routes/app_pages.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await initServices();
  runApp(const MyApp());
}

// Is a smart move to make your Services intiialize before you run the Flutter app.
/// as you can control the execution flow (maybe you need to load some Theme configuration,
/// apiKey, language defined by the User... so load SettingService before running ApiService.
/// so GetMaterialApp() doesnt have to rebuild, and takes the values directly.
Future<void> initServices() async {
  /// Here is where you put get_storage, hive, shared_pref initialization.
  /// or moor connection, or whatever that's async.
  await dotenv.load(fileName: ".env");
  await Get.putAsync(() => AuthenticationService().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeStyle themeStyle = ThemeStyle();

    return ScreenUtilInit(
      designSize: const Size(375, 812), // Iphone 13 Mini
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(
              useMaterial3: true,
              textTheme: themeStyle.textThemeStyle(),
              colorScheme: lightColorScheme),
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
