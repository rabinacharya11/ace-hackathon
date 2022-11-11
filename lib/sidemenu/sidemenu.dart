import 'package:flutter/material.dart';
import 'package:waste_manage_sys/theme/uiparameters.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UIParameters.getWidth(context) * 0.7,
      child: Drawer(
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
    );
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

ListTile listTile(
    {required BuildContext context,
    IconData? icon,
    required String text,
    required Function()? onClick}) {
  return ListTile(
      visualDensity: const VisualDensity(horizontal: 0, vertical: -3),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      minLeadingWidth: 20,
      leading: icon != null
          ? Icon(
              icon,
              color: Theme.of(context).textTheme.headline2!.color,
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
