import 'package:flutter/material.dart';
import 'package:waste_manage_sys/food_management_sys/application/food_service.dart';

class FoodPageProvider extends ChangeNotifier {
  List<FoodModel> _fms = [];
  List<FoodModel> get fms => _fms;

  FoodPageProvider() {
    init();
  }

  init() async {
    _fms = await readJsonData();
    notifyListeners();
  }
}
