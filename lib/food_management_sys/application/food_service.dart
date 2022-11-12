import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;

class FoodService {}

class FoodModel {
  int? id;
  String? imageLink;
  int? contact;
  int? price;
  String? title;
  String? descrption;
  String? address;

  FoodModel(
      {this.id,
      this.imageLink,
      this.contact,
      this.price,
      this.title,
      this.descrption,
      this.address});

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageLink = json['image_link'];
    contact = json['contact'];
    price = json['price'];
    title = json['title'];
    descrption = json['descrption'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image_link'] = imageLink;
    data['contact'] = contact;
    data['price'] = price;
    data['title'] = title;
    data['descrption'] = descrption;
    data['address'] = address;
    return data;
  }
}

Future<List<FoodModel>> ReadJsonData() async {
  //read json file
  final jsondata = await rootBundle.rootBundle
      .loadString("lib/food_management_sys/domain/food_data.json");
  //decode json data as list
  final list = json.decode(jsondata) as List<dynamic>;

  //map json and initialize using DataModel
  return list.map((e) => FoodModel.fromJson(e)).toList();
}
