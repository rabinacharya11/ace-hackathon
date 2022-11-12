import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waste_manage_sys/routes/routes_constant.dart';
import 'package:waste_manage_sys/storage/storage_services.dart';
import 'package:waste_manage_sys/theme/theme_data.dart';
import 'package:waste_manage_sys/theme/uiparameters.dart';
import 'package:waste_manage_sys/widget/appbar.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final StorageServices ss = StorageServices();

  String imgUrl =
      'https://cdn.shopify.com/s/files/1/0070/7032/files/tshirt-business8-min_838a2996-f195-4c1d-a4d1-034bc0a9a095.jpg?v=1597402071';
  String title = 'Rounded T-shirt';
  int price = 250;
  String size = 'L';

  @override
  void initState() {
    super.initState();
    // init();
  }

  // init() async {
  //   imgUrl = await ss.readData(key: ss.imgUrl) ??
  //       'https://cdn.shopify.com/s/files/1/0070/7032/files/tshirt-business8-min_838a2996-f195-4c1d-a4d1-034bc0a9a095.jpg?v=1597402071';
  //   title = await ss.readData(key: ss.title) ?? 'Rounded T-shirt';
  //   price = await ss.readData(key: ss.price) ?? 250;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 20, overflow: TextOverflow.ellipsis),
        title: const Text('My Order'),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Deliver Address
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.grey[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  const Text(
                    'Deliver Address',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  const SizedBox(height: 10),

                  // Current Location
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration:
                        BoxDecoration(border: Border.all(color: kPrimaryColor)),
                    child: Text(
                      'Ace Institue of Management, New Baneshwor, KTM',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Your Cart
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
              margin: const EdgeInsets.only(bottom: 8),
              color: Colors.grey[50],
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Orders',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const SizedBox(height: 5),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          width: UIParameters.getWidth(context) - 28,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                imageUrl: imgUrl,
                                height: 100,
                                width: 100,
                                errorWidget: ((context, url, error) =>
                                    Image.network(
                                      "https://cdn.shopify.com/s/files/1/0070/7032/files/tshirt-business8-min_838a2996-f195-4c1d-a4d1-034bc0a9a095.jpg?v=1597402071",
                                      height: 100,
                                      width: 100,
                                    )),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Rs.$price",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Processing..",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 55,
                                    child: Text(
                                      "( $size )",
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                    ),
                                    child: Text('Cancel'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),

            // Receipt
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              margin: const EdgeInsets.only(bottom: 8),
              color: Colors.grey[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Receipt',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('subtotal (include VAT, SD)'),
                      Text('Rs. $price'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Delivery fee'),
                      Text('Rs. 60'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Bill'),
                      Text('Rs. ${price + 60}'),
                    ],
                  ),
                ],
              ),
            ),

            // Back Button
            Container(
              color: Colors.grey[50],
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              margin: const EdgeInsets.only(bottom: 8),
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(RouteConstant.homeScreen);
                },
                style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                child: const Text(
                  'Back',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
