import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waste_manage_sys/routes/routes_constant.dart';
import 'package:waste_manage_sys/theme/theme_data.dart';
import 'package:waste_manage_sys/theme/uiparameters.dart';

class AddItemsScreen extends StatefulWidget {
  const AddItemsScreen({super.key});

  @override
  State<AddItemsScreen> createState() => _AddItemsScreenState();
}

class _AddItemsScreenState extends State<AddItemsScreen> {
  final TextEditingController _myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _myController.text = '0';
  }

  List<String> ngos = [
    "Any",
    "The ISIS Foundation",
    "Child Protection Centers and Services/CPCS",
    "Karuna Foundation",
    "Leprosy Mission Nepal",
    "Light for the World",
    "LWF Nepal",
  ];
  String selectval = "Any";
  File? _photo;
  bool isuploaded = false;
  bool isselling = false;
  bool isdonating = false;
  Future imgFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
      } else {}
    });
  }

  Future imgFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        TextEditingController().clear();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              overflow: TextOverflow.ellipsis),
          title: const Text('Add Items'),
        ),
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Your Cart
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                margin: const EdgeInsets.symmetric(vertical: 8),
                color: Colors.grey[50],
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Product Details',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    _photo != null
                                        ? Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  _showPicker(context);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white38,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Image.file(
                                                    _photo!,
                                                    width: 80,
                                                    height: 80,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              const SizedBox(height: 15),
                                              Card(
                                                  color: Colors.grey[300],
                                                  child: IconButton(
                                                      onPressed: () {
                                                        _showPicker(context);
                                                      },
                                                      icon: const Icon(
                                                          Icons.add))),
                                              const SizedBox(height: 5),
                                              Text(
                                                "Add Image",
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                ),
                                              )
                                            ],
                                          ),
                                    const SizedBox(width: 20),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          112,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          label: Text("Add your product name"),
                                          labelStyle: TextStyle(fontSize: 15),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 5.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 18),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 28,
                                  child: TextFormField(
                                    maxLines: 3,
                                    decoration: const InputDecoration(
                                      label:
                                          Text("Add your product description"),
                                      labelStyle: TextStyle(fontSize: 15),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 5.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),

              // Address
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                margin: const EdgeInsets.only(bottom: 8),
                color: Colors.grey[50],
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Address',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
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
                      decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor)),
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
                            'Ace Institue of Management, New Baneshwor, KTM',
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
                          borderSide:
                              BorderSide(color: Colors.black, width: 5.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Sell & Donate
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                margin: const EdgeInsets.only(bottom: 8),
                color: Colors.grey[50],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 100,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isselling = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          child: const Text("Sell",
                              style: TextStyle(fontSize: 16))),
                    ),
                    SizedBox(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isselling = false;
                                isdonating = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            child: const Text("Donate")))
                  ],
                ),
              ),

              // Receipt
              if (isselling)
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  margin: const EdgeInsets.only(bottom: 8),
                  color: Colors.grey[50],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Receipt',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Price'),
                          SizedBox(
                            width: 60,
                            height: 30,
                            child: TextFormField(
                              controller: _myController,
                              autofocus: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('FoodRobe Commission'),
                          Text('Rs.${int.parse(_myController.text) * 0.2}'),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('You will get'),
                          Text(
                              'Rs.${int.parse(_myController.text) - int.parse(_myController.text) * 0.2}'),
                        ],
                      ),
                    ],
                  ),
                ),

              if (isdonating)
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  margin: const EdgeInsets.only(bottom: 8),
                  color: Colors.grey[50],
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Select NGO/INGOs',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField(
                        value: selectval,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        isDense: true,
                        isExpanded: true,
                        onChanged: (value) {
                          setState(() {
                            selectval = value.toString();
                          });
                        },
                        items: ngos.map((itemone) {
                          return DropdownMenuItem(
                              value: itemone, child: Text(itemone));
                        }).toList(),
                      ),
                    ],
                  ),
                ),

              // Place Order
              if (isselling || isdonating)
                Container(
                  color: Colors.grey[50],
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.only(bottom: 8),
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Item Placed'),
                        duration: Duration(milliseconds: 1500),
                      ));
                      await Future.delayed(const Duration(milliseconds: 2500));
                      Navigator.of(context)
                          .pushReplacementNamed(RouteConstant.homeScreen);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Gallery'),
                    tileColor: Colors.white30,
                    onTap: () {
                      imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  tileColor: Colors.white30,
                  onTap: () {
                    imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }
}
