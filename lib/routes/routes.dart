import 'package:flutter/material.dart';
import 'package:waste_manage_sys/home_screen/presentation/home_screen.dart';
import 'package:waste_manage_sys/home_screen/presentation/splash_screen.dart';
import 'package:waste_manage_sys/routes/routes_constant.dart';
import 'package:waste_manage_sys/utils/page_transition.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case RouteConstant.splashScreen:
      return FadeInRoute(page: const SplashScreen());
    case RouteConstant.homeScreen:
      return FadeInRoute(page: const HomeScreen());
    default:
      return FadeInRoute(page: const SplashScreen());
  }
}
