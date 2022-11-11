import 'package:flutter/material.dart';
import 'package:waste_manage_sys/food_management_sys/application/food_service.dart';
import 'package:waste_manage_sys/routes/routes_constant.dart';
import 'package:waste_manage_sys/sidemenu/sidemenu.dart';
import 'package:waste_manage_sys/theme/theme_data.dart';
import 'package:waste_manage_sys/widget/appbar.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: appBar("Food Page"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
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

  Stack drawerHeader(BuildContext context) {
    // var loc = AppLocalizations.of(context)!;
    return Stack(
      children: [
        DrawerHeader(
          margin: null,
          padding: const EdgeInsets.only(left: 10),
          decoration: const BoxDecoration(
              // gradient: appBarGradient(context),
              color: Colors.black26),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                // Image.asset("assets/images/logo_circular.png", height: 90, width: 90),
                Icon(Icons.add),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "Jadu",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned.fill(
          top: -260,
          left: -20,
          right: -20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomPaint(painter: CircleOne()),
              CustomPaint(painter: CircleTwo()),
            ],
          ),
        ),
      ],
    );
  }
}

FutureBuilder<List<FoodModel>> fetchData() {
  return FutureBuilder(
      future: ReadJsonData(),
      builder: (context, data) {
        if (data.hasError) {
          //in case if error found
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var items = data.data as List<FoodModel>;
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
                                      Text("Contact Info. ${items[i].contact}",
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
