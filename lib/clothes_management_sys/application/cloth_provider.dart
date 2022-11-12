import 'package:flutter/material.dart';
import 'package:waste_manage_sys/clothes_management_sys/application/cloth_service.dart';

class ClothPageProvider extends ChangeNotifier {
  List<ClothModel> _cms = [];
  List<ClothModel> get cms => _cms;

  ClothPageProvider() {
    init();
  }

  init() async {
    _cms = await readJsonData();
    notifyListeners();
  }
}
