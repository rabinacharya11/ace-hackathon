import 'package:flutter/material.dart';
import 'package:waste_manage_sys/clothes_management_sys/application/cloth_service.dart';
import 'package:waste_manage_sys/routes/routes_constant.dart';
import 'package:waste_manage_sys/theme/theme_data.dart';

class ViewCloth extends StatelessWidget {
  final ClothModel cloth;
  const ViewCloth({super.key, required this.cloth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              overflow: TextOverflow.ellipsis),
          title: Text(cloth.title!),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // const SizedBox(height: 20),/ssss
              Card(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height / 3.5,
                      width: double.infinity,
                      child: Image.network(cloth.imageLink!))),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cloth.title!,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 10),
                          Text("Rs. ${cloth.price.toString()}",
                              style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(height: 20),
                          const Text("Product Description",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w300)),
                          Text(cloth.descrption!,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                child: ElevatedButton(
                                  onPressed: () => Navigator.of(context)
                                      .pushNamed(RouteConstant.deliverScreen,
                                          arguments: {"data": cloth}),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: kPrimaryColor),
                                  child: const Text(
                                    'Place Order',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
