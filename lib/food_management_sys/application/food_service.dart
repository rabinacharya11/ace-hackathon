import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;

class FoodService {}

class FoodModel {
  String? imageLink;
  int? contact;
  int? price;
  String? title;
  String? descrption;

  FoodModel(
      {this.imageLink, this.contact, this.price, this.title, this.descrption});

  FoodModel.fromJson(Map<String, dynamic> json) {
    imageLink = json['image_link'];
    contact = json['contact'];
    price = json['price'];
    title = json['title'];
    descrption = json['descrption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image_link'] = this.imageLink;
    data['contact'] = this.contact;
    data['price'] = this.price;
    data['title'] = this.title;
    data['descrption'] = this.descrption;
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
