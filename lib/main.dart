import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:waste_manage_sys/clothes_management_sys/application/cloth_provider.dart';
import 'package:waste_manage_sys/food_management_sys/application/food_provider.dart';
import 'package:waste_manage_sys/network/internet_provider.dart';
import 'package:waste_manage_sys/routes/routes.dart';
import 'package:waste_manage_sys/theme/theme_data.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: kStatusBarColor,
    statusBarBrightness: Brightness.light,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => InternetProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FoodPageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ClothPageProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Waste Management App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          textTheme: GoogleFonts.nunitoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        onGenerateRoute: routes,
        initialRoute: '/',
      ),
    );
  }
}
