// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:waste_manage_sys/network/internet_provider.dart';
import 'package:waste_manage_sys/routes/routes.dart';
import 'package:waste_manage_sys/theme/theme_data.dart';

// import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  // // analytics and crashlytics
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;
  // await firebaseAnalytics.logAppOpen();

  // // Pass all uncaught errors from the framework to Crashlytics.
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: kStatusBarColor));

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

        // ChangeNotifierProvider(
        //   create: (context) => AuthProvider(),
        // ),
      ],
      child: const MaterialApp(
        title: 'Waste Management App',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: routes,
        initialRoute: '/',
      ),
    );
  }
}
