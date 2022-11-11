import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


import '../../widget/appbar.dart';

class AddCloth extends StatefulWidget {
  const AddCloth({super.key});

  @override
  State<AddCloth> createState() => _AddClothState();
}

class _AddClothState extends State<AddCloth> {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final priceContoller = TextEditingController();
    final contactController = TextEditingController();
    final clothDetailController = TextEditingController();

    return Scaffold(
      appBar: appBar(title: "Add Your Cloth"),
      body: Column(
        children: [
          _textField(controller: titleController),
          _textField(controller: priceContoller),
          _textField(controller: contactController),
          _textField(controller: clothDetailController),
        ],
      ),
    );
  }

  _textField({
    String? labelText,
    String? hintText,
    required TextEditingController controller,
    TextInputType type = TextInputType.text,
  }) {
    return TextField();
  }
}
