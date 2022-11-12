class Food {
  final int id;
  final String title;
  final double price;
  final String contactNo;
  final String? description;
  final String imgUrl;
  final String address;

  Food(
      {required this.id,
      required this.title,
      required this.price,
      required this.contactNo,
      this.description,
      required this.address,
      required this.imgUrl});

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        contactNo: json['contact'],
        address: json['address'],
        imgUrl: json['image_link'],
      );
}
