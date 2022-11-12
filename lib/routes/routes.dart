import 'package:flutter/material.dart';
import 'package:waste_manage_sys/add_items_screen/add_items.dart';
import 'package:waste_manage_sys/authentication/presentation/login.dart';
import 'package:waste_manage_sys/authentication/presentation/register.dart';
import 'package:waste_manage_sys/edit_address/edit_address_screen.dart';
import 'package:waste_manage_sys/food_management_sys/presentation/food_detail.dart';
import 'package:waste_manage_sys/deliver_screen/presentation/deliver_screen.dart';

import 'package:waste_manage_sys/home_screen/presentation/home_screen.dart';
import 'package:waste_manage_sys/home_screen/presentation/splash_screen.dart';
import 'package:waste_manage_sys/orders_screen/orders_screen.dart';
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

    case RouteConstant.addItems:
      return FadeInRoute(page: const AddItemsScreen());

    case RouteConstant.orderScreen:
      return FadeInRoute(page: const OrderScreen());

    case RouteConstant.editAddressScreen:
      return FadeInRoute(page: const EditAddressScreen());

    case RouteConstant.deliverScreen:
      final args = arguments as Map<String, dynamic>?;
      return FadeInRoute(page: DeliverScreen(data: args!["data"]));

    case RouteConstant.clothDetail:
      final args = arguments as Map<String, dynamic>?;
      return FadeInRoute(page: ViewCloth(cloth: args!["cloth"]));

    case RouteConstant.loginScreen:
      return FadeInRoute(page: const LoginScreen());

    case RouteConstant.createuser:
      return FadeInRoute(page: const CreateUser());

    case RouteConstant.foodDetail:
      final args = arguments as Map<String, dynamic>?;
      return FadeInRoute(page: ViewFood(food: args!["food"]));

    default:
      return FadeInRoute(page: const SplashScreen());
  }
}
