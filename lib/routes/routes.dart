import 'package:flutter/material.dart';
import 'package:waste_manage_sys/food_management_sys/presentation/foodedetail.dart';
import 'package:waste_manage_sys/deliver_screen/presentation/deliver_screen.dart';

import 'package:waste_manage_sys/home_screen/presentation/home_screen.dart';
import 'package:waste_manage_sys/home_screen/presentation/splash_screen.dart';
import 'package:waste_manage_sys/routes/routes_constant.dart';
import 'package:waste_manage_sys/utils/page_transition.dart';

import '../clothes_management_sys/presentation/cloth_detail.dart';

Route routes(RouteSettings settings) {
  final arguments = settings.arguments;
  switch (settings.name) {
    case RouteConstant.splashScreen:
      return FadeInRoute(page: const SplashScreen());
    case RouteConstant.homeScreen:
      return FadeInRoute(page: const HomeScreen());
    case RouteConstant.deliverScreen:
      return FadeInRoute(page: const DeliverScreen());
    case RouteConstant.clothDetail:
      final args = arguments as Map<String, dynamic>?;
      return FadeInRoute(page: ViewCloth(cloth: args!["cloth"]));
    case RouteConstant.foodDetail:
      final args = arguments as Map<String, dynamic>?;
      return FadeInRoute(page: ViewFood(food: args!["food"]));
    default:
      return FadeInRoute(page: const SplashScreen());
  }
}
