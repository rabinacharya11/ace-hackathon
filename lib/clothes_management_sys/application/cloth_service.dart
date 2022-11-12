import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;

class ClothService {}

class ClothModel {
  int? id;
  String? imageLink;
  String? address;
  int? contact;
  int? price;
  String? title;
  String? descrption;

  ClothModel(
      {this.id,
      this.imageLink,
      this.contact,
      this.address,
      this.price,
      this.title,
      this.descrption});

  ClothModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageLink = json['image_link'];
    contact = json['contact'];
    address = json['address'];
    price = json['price'];
    title = json['title'];
    descrption = json['descrption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image_link'] = imageLink;
    data['contact'] = contact;
    data['address'] = address;
    data['price'] = price;
    data['title'] = title;
    data['descrption'] = descrption;
    return data;
  }
}

Future<List<ClothModel>> readJsonData() async {
  //read json file
  final jsondata = await rootBundle.rootBundle
      .loadString("lib/clothes_management_sys/domain/cloth_data.json");
  //decode json data as list
  final list = json.decode(jsondata) as List<dynamic>;

  //map json and initialize using DataModel
  return list.map((e) => ClothModel.fromJson(e)).toList();
}
