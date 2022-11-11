import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waste_manage_sys/theme/theme_data.dart';

class DeliverScreen extends StatelessWidget {
  const DeliverScreen({super.key});

  final String _deliverAddress =
      'Ace Institue of Management, New Baneshwor, KTM';
  final String _pickupAddress = 'Sandar Momo, Gothaghar, Bhaktapur';
  final String _sellerImgUrl =
      'https://the-corporate.com/public/profile_images/72100-1618913819.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title:
            const Text("Clothes Page", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.grey[50],
        elevation: 1,
        actions: const [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(width: 20),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
                      'Your Cart',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.business),
                        const SizedBox(width: 10),
                        Text(_pickupAddress)
                      ],
                    )
                  ],
                ),
                const Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CachedNetworkImage(
                    imageUrl: _sellerImgUrl,
                    height: 50,
                    width: 50,
                  ),
                ),
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
                  children: const [
                    Text('subtotal (include VAT, SD)'),
                    Text('रु. 420'),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Delivery fee'),
                    Text('रु. 60'),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Total Bill'),
                    Text('रु. 480'),
                  ],
                ),
              ],
            ),
          ),

          // Place Order
          Container(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
              child: const Text(
                'Place Order',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
