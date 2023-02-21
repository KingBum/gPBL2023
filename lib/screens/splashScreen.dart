import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gbpl_2023/screens/homeScreen.dart';
import '../utils/helper.dart';
import '../const/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  @override
  void initState() {
    _timer = Timer(const Duration(milliseconds: 4000), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        decoration: BoxDecoration(color: AppColor.blue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 100,
                child: Image.asset(
                  Helper.getAssetName("splash.png", "real"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text("GREEN HOUSE", textAlign: TextAlign.center, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColor.white),)
          ],
        ),
      ),
    );
  }
}