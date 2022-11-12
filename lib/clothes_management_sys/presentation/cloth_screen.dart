import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waste_manage_sys/clothes_management_sys/application/cloth_provider.dart';
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
      appBar: appBar(title: "Clothes"),
      body: SingleChildScrollView(
        child: Consumer<ClothPageProvider>(
          builder: ((context, provider, child) {
            if (provider.cms.isEmpty) {
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
    final cms = context.watch<ClothPageProvider>().cms;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cms.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (BuildContext c, int i) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteConstant.clothDetail, arguments: {"cloth": cms[i]});
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
                          cms[i].imageLink!,
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
                    Text("${cms[i].title}",
                        overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400)),
                    const SizedBox(height: 5),
                    Text("${cms[i].address}",
                        style: const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis, color: Colors.black54, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 5),
                    Text("Rs. ${cms[i].price.toString()}", style: TextStyle(fontSize: 18, color: kPrimaryColor, fontWeight: FontWeight.w500)),
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
