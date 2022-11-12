import 'dart:async';

import 'package:flutter/material.dart';
import 'package:waste_manage_sys/routes/routes_constant.dart';
import 'package:waste_manage_sys/theme/theme_data.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 3000), () async {
      Navigator.of(context).pushReplacementNamed(RouteConstant.loginScreen);
    });
    return Scaffold(
      body: SizedBox.expand(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              Image.asset(
                "assets/images/logo.png",
                height: 200,
                width: 200,
              ),
              // Spacer(),
              const SizedBox(height: 10),
              const Text(
                'FoodRobe',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // const SizedBox(height: 10),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Doing the magic for you',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                        strokeWidth: 2,
                      )),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
