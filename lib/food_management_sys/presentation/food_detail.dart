import 'package:flutter/material.dart';
import 'package:waste_manage_sys/food_management_sys/application/food_service.dart';
import 'package:waste_manage_sys/routes/routes_constant.dart';
import 'package:waste_manage_sys/theme/theme_data.dart';

class ViewFood extends StatelessWidget {
  final FoodModel food;
  const ViewFood({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              overflow: TextOverflow.ellipsis),
          title: Text(food.title!),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // const SizedBox(height: 20),/ssss
              Container(
                color: Colors.grey[50],
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: MediaQuery.of(context).size.height / 3.5,
                width: double.infinity,
                child: Image.network(food.imageLink!),
              ),

              Container(
                color: Colors.grey[50],
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                margin: const EdgeInsets.only(bottom: 8),
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.title!,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text("Rs. ${food.price.toString()}",
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.orange,
                              fontWeight: FontWeight.w600)),
                    ]),
              ),

              Container(
                color: Colors.grey[50],
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                margin: const EdgeInsets.only(bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Product Description",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 10),
                    Text(food.descrption!,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),

              Container(
                color: Colors.grey[50],
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: const EdgeInsets.only(bottom: 8),
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed(
                      RouteConstant.deliverScreen,
                      arguments: {"data": food}),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                  child: const Text(
                    'Place Order',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
