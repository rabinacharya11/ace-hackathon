import 'package:flutter/material.dart';
import 'package:waste_manage_sys/clothes_management_sys/application/cloth_service.dart';
import 'package:waste_manage_sys/routes/routes_constant.dart';
import 'package:waste_manage_sys/sidemenu/sidemenu.dart';
import 'package:waste_manage_sys/theme/theme_data.dart';
import 'package:waste_manage_sys/widget/appbar.dart';

class ClothScreen extends StatefulWidget {
  const ClothScreen({super.key});

  @override
  State<ClothScreen> createState() => _ClothScreenState();
}

class _ClothScreenState extends State<ClothScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      backgroundColor: Colors.white,
      appBar: appBar(title: "Clothes"),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(RouteConstant.addItems),
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height, child: fetchData()),
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<ClothModel>> fetchData() {
    return FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            //in case if error found
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<ClothModel>;
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true, // calling the neverscrollable functio here
                scrollDirection: Axis.vertical,
                // ignore: unnecessary_null_comparison
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: GridView.builder(
                        itemCount: items.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.7),
                        itemBuilder: (BuildContext c, int i) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteConstant.clothDetail,
                                  arguments: {"cloth": items[i]});
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              shadowColor: Colors.black,
                              elevation: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 150,
                                        child: Image.network(
                                          items[i].imageLink!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(width: 10),
                                        Text("${items[i].title}",
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400)),
                                        const SizedBox(width: 10, height: 5),
                                        Text(
                                            "Contact Info. ${items[i].contact}",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w500)),
                                        const SizedBox(height: 5),
                                        Text("Rs. ${items[i].price.toString()}",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: kPrimaryColor,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ));
                });
          } else {
            // show circular progress while data is getting fetched from json file
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
