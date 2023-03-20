import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/news_screen_controller.dart';

class NewsScreenView extends GetView<NewsScreenController> {
  const NewsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'NewsScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
