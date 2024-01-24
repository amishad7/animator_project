import 'package:animator/app/views/home_view/view/home.dart';
import 'package:animator/app/views/splash_view/view/splash_view.dart';
import 'package:flutter/material.dart';

import 'app/views/sub_view/sub.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const SplashView(),
        "/home": (context) => const HomeView(),
        "/sub": (context) => const SubView(),
      },
    ),
  );
}
