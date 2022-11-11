import 'package:flutter/material.dart';

AppBar appBar({ required String title}) {
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.black),
    title: Text(title, style: const TextStyle(color: Colors.black)),
    backgroundColor: Colors.white,
    elevation: 0,
    actions: const [
      Icon(
        Icons.search,
        color: Colors.black,
      ),
      SizedBox(width: 20),
    ],
  );
}
