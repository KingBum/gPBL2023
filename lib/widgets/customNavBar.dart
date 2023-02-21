import 'package:flutter/material.dart';
import 'package:gbpl_2023/screens/homeScreen.dart';
import 'package:gbpl_2023/screens/humiScreen.dart';
import 'package:gbpl_2023/screens/lightScreen.dart';
import 'package:gbpl_2023/screens/tempScreen.dart';

import '../const/colors.dart';
import '../utils/helper.dart';


class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key, required this.home, required this.temp, required this.light, required this.humi}) : super(key: key);
  final bool home;
  final bool temp;
  final bool light;
  final bool humi;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: Helper.getScreenWidth(context),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              width: Helper.getScreenWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 1,
                    color: AppColor.placeholder,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (!home) {
                            Navigator.of(context)
                                .pushReplacementNamed(HomeScreen.routeName);
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            home
                                ? Icon(Icons.home, size: 30,color: AppColor.blue,)
                                : Icon(Icons.home_outlined, size: 30,),
                            home
                                ? Text("Home",
                                style: TextStyle(color: AppColor.blue))
                                : Text(""),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!temp) {
                            Navigator.of(context)
                                .pushReplacementNamed(TempScreen.routeName);
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            temp
                                ? Icon(Icons.thermostat, size: 30,color: AppColor.blue,)
                                : Icon(Icons.thermostat_outlined, size: 30,),
                            temp
                                ? Text("Temp",
                                style: TextStyle(color: AppColor.blue))
                                : Text(""),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!light) {
                            Navigator.of(context)
                                .pushReplacementNamed(LightScreen.routeName);
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            light
                                ? Icon(Icons.lightbulb, size: 30,color: AppColor.blue,)
                                : Icon(Icons.lightbulb_outline, size: 30,),
                            light
                                ? Text("Light",
                                style: TextStyle(color: AppColor.blue))
                                : Text(""),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!humi) {
                            Navigator.of(context)
                                .pushReplacementNamed(HumiScreen.routeName);
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            humi
                                ? Icon(Icons.smart_toy, size: 30,color: AppColor.blue,)
                                : Icon(Icons.smart_toy_outlined, size: 30,),
                            humi
                                ? Text("BOT",
                                style: TextStyle(color: AppColor.blue))
                                : Text(""),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
