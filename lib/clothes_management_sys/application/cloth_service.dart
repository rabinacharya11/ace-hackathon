import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;

class ClothService {}

class ClothJson {
  String? imageLink;
  int? number;
  int? price;
  String? name;
  String? descrption;

  ClothJson({this.imageLink, this.number, this.price, this.name, this.descrption});

  ClothJson.fromJson(Map<String, dynamic> json) {
    imageLink = json['imageLink'];
    number = json['number'];
    price = json['price'];
    name = json['name'];
    descrption = json['descrption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageLink'] = imageLink;
    data['number'] = number;
    data['price'] = price;
    data['name'] = name;
    data['descrption'] = descrption;
    return data;
  }
}

Future<List<ClothJson>> ReadJsonData() async {
  //read json file
  final jsondata = await rootBundle.rootBundle.loadString("lib/clothes_management_sys/domain/data.json");
  //decode json data as list
  final list = json.decode(jsondata) as List<dynamic>;

  //map json and initialize using DataModel
  return list.map((e) => ClothJson.fromJson(e)).toList();
}
