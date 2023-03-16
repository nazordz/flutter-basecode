import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gooritabasecode/config/color_schemes.g.dart';
import 'package:gooritabasecode/config/theme.dart';

import 'app/routes/app_pages.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeStyle themeStyle = ThemeStyle();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
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
