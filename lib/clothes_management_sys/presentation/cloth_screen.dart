import 'package:flutter/material.dart';
import 'package:waste_manage_sys/clothes_management_sys/application/cloth_service.dart';
import 'package:waste_manage_sys/routes/routes_constant.dart';

class ClothScreen extends StatefulWidget {
  const ClothScreen({super.key});

  @override
  State<ClothScreen> createState() => _ClothScreenState();
}

class _ClothScreenState extends State<ClothScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            // Header
            drawerHeader(context),
            const SizedBox(height: 10),
            drawerBody(context),
            const Spacer(),
            const Divider(thickness: 0.8),
            listTile(context: context, text: "Version 1.0.0", onClick: () {})
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        // leading: const Icon(
        //   Icons.menu,
        //   color: Colors.black,
        // ),
        title: const Text("Clothes Page", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(width: 20),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height, child: fetchData()),
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

Widget drawerBody(BuildContext context) {
  // var loc = AppLocalizations.of(context)!;
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: ListView(
      shrinkWrap: true,
      children: [
        listTile(
            context: context,
            icon: Icons.home,
            text: "Home",
            onClick: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/cvt');
            }),
        listTile(
            context: context,
            icon: Icons.person,
            text: "Profile",
            onClick: () {
              Navigator.pop(context);
            }),

        const Divider(thickness: 0.8),

        listTile(
            context: context,
            icon: Icons.edit_note,
            text: "Clothes",
            onClick: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/of');
            }),

        listTile(
            context: context,
            icon: Icons.fact_check_outlined,
            text: "Food",
            onClick: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/lps');
            }),

        const Divider(thickness: 0.8),

        listTile(
            context: context,
            icon: Icons.settings_outlined,
            text: "Settings",
            onClick: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/settings');
            }),

        // Share App
        listTile(
          context: context,
          icon: Icons.share_outlined,
          text: "Share",
          onClick: () async {
            Navigator.pop(context);
            // await Share.share(
            //     'https://play.google.com/store/apps/details?id=com.subarnainfotech.nepal_driving_license_app');
          },
        ),

        // Rate Us
        listTile(
          context: context,
          icon: Icons.star_border_outlined,
          text: "Rate Us",
          onClick: () async {
            Navigator.pop(context);
            // await RateMyApp().launchStore();
          },
        ),

        // Exit
        listTile(
          context: context,
          icon: Icons.exit_to_app,
          text: "Log Out",
          onClick: () async {
            Navigator.pop(context);
            // exitAppConfirmation(context);
          },
        ),
      ],
    ),
  );
}

ListTile listTile({required BuildContext context, IconData? icon, required String text, required Function()? onClick}) {
  return ListTile(
      visualDensity: const VisualDensity(horizontal: 0, vertical: -3),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      minLeadingWidth: 20,
      leading: icon != null
          ? Icon(
              icon,
              color: Theme.of(context).textTheme.displayMedium!.color,
            )
          : null,
      title: Text(text, style: const TextStyle(fontSize: 15)),
      onTap: onClick);
}

class CircleOne extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        const Offset(28, 0),
        99,
        Paint()
          ..color = Colors.white24
          ..strokeWidth = 10
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CircleTwo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        const Offset(-30, 20),
        50,
        Paint()
          ..color = Colors.white24
          ..strokeWidth = 10
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

FutureBuilder<List<ClothJson>> fetchData() {
  return FutureBuilder(
      future: ReadJsonData(),
      builder: (context, data) {
        if (data.hasError) {
          //in case if error found
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var items = data.data as List<ClothJson>;
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
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (BuildContext c, int i) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RouteConstant.clothDetail, arguments: {"cloth": items[i]});
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(width: 10),
                                      Text("${items[i].name}",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400)),
                                      const SizedBox(width: 10, height: 5),
                                      Text("Contact Info. ${items[i].number}",
                                          style: const TextStyle(
                                              fontSize: 14, overflow: TextOverflow.ellipsis, color: Colors.black54, fontWeight: FontWeight.w500)),
                                      const SizedBox(height: 5),
                                      Text("Rs. ${items[i].price.toString()}",
                                          style: const TextStyle(fontSize: 18, color: Colors.orange, fontWeight: FontWeight.w500)),
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
