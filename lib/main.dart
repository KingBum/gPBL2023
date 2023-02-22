import 'package:firebase_core/firebase_core.dart';
import 'package:gbpl_2023/screens/homeScreen.dart';

import 'package:flutter/material.dart';
import 'package:gbpl_2023/screens/humiScreen.dart';
import 'package:gbpl_2023/screens/lightScreen.dart';
import 'package:gbpl_2023/screens/splashScreen.dart';
import 'package:gbpl_2023/screens/tempScreen.dart';
import './const/colors.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        fontFamily: "Metropolis",
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              AppColor.blue,
            ),
            shape: MaterialStateProperty.all(
              StadiumBorder(),
            ),
            elevation: MaterialStateProperty.all(0),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
              AppColor.blue,
            ),
          ),
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: AppColor.secondary,
          ),
        ),
      ),
      home: SplashScreen(),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        HumiScreen.routeName: (context) => HumiScreen(),
        LightScreen.routeName: (context) => LightScreen(),
        TempScreen.routeName: (context) => TempScreen(),
      },
    );
  }
}