import 'package:animator/app/views/home_view/view/home.dart';
import 'package:animator/app/views/splash_view/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/views/sub_view/sub.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/home',
          page: () => const HomeView(),
        ),
        GetPage(
          name: '/splash',
          page: () => const SplashView(),
        ),
        GetPage(
          name: '/sub',
          page: () => const SubView(),
        ),
      ],
    ),
  );
}
