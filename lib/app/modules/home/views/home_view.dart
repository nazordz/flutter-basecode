import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gooritabasecode/app/modules/home/homeScreen/views/home_screen_view.dart';
import 'package:gooritabasecode/app/modules/home/newsScreen/views/news_screen_view.dart';
import 'package:gooritabasecode/app/modules/home/profileScreen/views/profile_screen_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: controller.logout,
                  icon: const Icon(Icons.logout),
                  tooltip: 'Logout',
                )
              ],
            ),
            body: SafeArea(
              child: IndexedStack(
                index: controller.tabIndex.value,
                children: [
                  HomeScreenView(),
                  NewsScreenView(),
                  ProfileScreenView(),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: controller.tabIndex.value,
                onTap: (value) => controller.changeTabIndex(value),
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.newspaper), label: 'News'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Profile'),
                ]));
      },
    );
  }
}
