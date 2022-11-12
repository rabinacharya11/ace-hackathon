// ignore_for_file: file_names

// class ClothModel {
//   final String title;
//   final double price;
//   final String number;
//   final String description;
//   final String productname;
//   final String imagelink;

//   ClothModel(this.title, this.price, this.number, this.description, this.productname, this.imagelink);

//   factory ClothModel.fromJson(Map<String, dynamic> json )=> ClothModel(title: "");
// }

class Cloth {
  final int id;
  final String title;
  final double price;
  final String contactNo;
  final String? description;
  final String imgUrl;

  Cloth(
      {required this.id,
      required this.title,
      required this.price,
      required this.contactNo,
      this.description,
      required this.imgUrl});

  factory Cloth.fromJson(Map<String, dynamic> json) => Cloth(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      contactNo: json['contact'],
      imgUrl: json['image_link']);
}
