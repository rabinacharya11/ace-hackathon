import 'package:flutter/material.dart';
import 'package:waste_manage_sys/DB/Models/clothModel.dart';

class ViewCloth extends StatelessWidget {
  final Cloth cloth;
  const ViewCloth({super.key, required this.cloth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 250, width: double.infinity, child: Image.network(cloth.imgUrl));
  }
}
