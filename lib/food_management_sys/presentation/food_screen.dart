import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waste_manage_sys/food_management_sys/application/food_provider.dart';
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
      appBar: appBar(title: "Food"),
      body: SingleChildScrollView(
        child: Consumer<FoodPageProvider>(
          builder: ((context, provider, child) {
            if (provider.fms.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return gridView();
            }
          }),
        ),
      ),
    );
  }

  Widget gridView() {
    final fms = context.watch<FoodPageProvider>().fms;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: fms.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (BuildContext c, int i) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteConstant.foodDetail,
                arguments: {"food": fms[i]});
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadowColor: Colors.black,
            elevation: 1,
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 165,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          fms[i].imageLink!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 10),
                    Text("${fms[i].title}",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    const SizedBox(height: 5),
                    Text("${fms[i].address}",
                        style: const TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 5),
                    Text("Rs. ${fms[i].price.toString()}",
                        style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
