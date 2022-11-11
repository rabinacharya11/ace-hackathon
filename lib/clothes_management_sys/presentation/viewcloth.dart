import 'package:flutter/material.dart';
import 'package:waste_manage_sys/DB/Models/clothModel.dart';
import 'package:waste_manage_sys/clothes_management_sys/application/cloth_service.dart';

class ViewCloth extends StatelessWidget {
  final ClothModel cloth;
  const ViewCloth({super.key, required this.cloth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 250, width: double.infinity, child: Image.network(cloth.imageLink!));
  }
}
