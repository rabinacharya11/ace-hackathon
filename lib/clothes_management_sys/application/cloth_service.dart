import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;

class ClothService {}

class ClothModel {
  String? imageLink;
  int? contact;
  int? price;
  String? title;
  String? descrption;

  ClothModel(
      {this.imageLink, this.contact, this.price, this.title, this.descrption});

  ClothModel.fromJson(Map<String, dynamic> json) {
    imageLink = json['image_link'];
    contact = json['contact'];
    price = json['price'];
    title = json['title'];
    descrption = json['descrption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_link'] = this.imageLink;
    data['contact'] = this.contact;
    data['price'] = this.price;
    data['title'] = this.title;
    data['descrption'] = this.descrption;
    return data;
  }
}

Future<List<ClothModel>> ReadJsonData() async {
  //read json file
  final jsondata = await rootBundle.rootBundle
      .loadString("lib/clothes_management_sys/domain/cloth_data.json");
  //decode json data as list
  final list = json.decode(jsondata) as List<dynamic>;

  //map json and initialize using DataModel
  return list.map((e) => ClothModel.fromJson(e)).toList();
}
