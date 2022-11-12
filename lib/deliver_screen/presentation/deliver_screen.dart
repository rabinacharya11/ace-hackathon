import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waste_manage_sys/routes/routes_constant.dart';
import 'package:waste_manage_sys/theme/theme_data.dart';
import 'package:waste_manage_sys/theme/uiparameters.dart';
import 'package:waste_manage_sys/widget/appbar.dart';

class DeliverScreen extends StatelessWidget {
  final dynamic data;

  const DeliverScreen({super.key, required this.data});

  final String _deliverAddress =
      'Ace Institue of Management, New Baneshwor, KTM';
  final String _pickupAddress = 'Sandar Momo, Gothaghar, Bhaktapur';
  final String _sellerImgUrl =
      'https://the-corporate.com/public/profile_images/72100-1618913819.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Deliver Screen"),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Deliver To
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.grey[50],
              child: Column(
                children: [
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Deliver To',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: const [
                            Text(
                              'Edit Address',
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 17,
                              color: Colors.deepOrange,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Current Location
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(border: Border.all(color: kPrimaryColor)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.check_circle_rounded,
                              color: kPrimaryColor,
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              'Current Location',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          _deliverAddress,
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Add Direction
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Add Direction(Road, Landmark, House etc.'),
                      prefixIcon: Icon(Icons.directions, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 5.0),
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
                        'Order',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          width: UIParameters.getWidth(context) - 28,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Rs.${data.price}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                              CachedNetworkImage(
                                imageUrl: data.imageLink,
                                height: 100,
                                width: 100,
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
                      Text('Rs. ${data.price}'),
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
                      Text('Rs. ${data.price + 60}'),
                    ],
                  ),
                ],
              ),
            ),

            // Place Order
            Container(
              color: Colors.grey[50],
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              margin: const EdgeInsets.only(bottom: 8),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Order Confirmed'),
                    duration: Duration(milliseconds: 1500),
                  ));
                  await Future.delayed(const Duration(milliseconds: 2500));
                  Navigator.of(context)
                      .pushReplacementNamed(RouteConstant.homeScreen);
                },
                style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                child: const Text(
                  'Confirm',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
