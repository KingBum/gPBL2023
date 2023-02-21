import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gbpl_2023/models/weather.dart';
import 'package:http/http.dart' as http ;
import 'package:gbpl_2023/const/colors.dart';
import 'package:gbpl_2023/utils/helper.dart';
import 'package:gbpl_2023/widgets/customDrawer.dart';
import 'package:gbpl_2023/widgets/customNavBar.dart';
import 'package:gbpl_2023/widgets/customTopBar.dart';


class TempScreen extends StatefulWidget {
  const TempScreen({Key? key}) : super(key: key);
  static const routeName = "/tempScreen";

  @override
  State<TempScreen> createState() => _TempScreenState();
}

class _TempScreenState extends State<TempScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.0),
              child: AppBar(
                  leading: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: const Icon(
                            Icons.menu,
                            color: AppColor.white,
                            size: 44, // Changing Drawer Icon Size
                          ),
                        ),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                      );
                    },
                  ),
                  title: CustomTopBar(),
                  centerTitle: true,
                  backgroundColor: Colors.blue),

            ),
            body: Container(
              width: Helper.getScreenWidth(context),
              height: Helper.getScreenHeight(context),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    Container(
                      height: 100,
                      child: Image.asset(
                        Helper.getAssetName("temp.png", "real"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text('Humi : 50℃ ', style: TextStyle(fontSize: 40),),
                    SizedBox(height: 30,),
                    Container(
                      height: 100,
                      child: Image.asset(
                        Helper.getAssetName("humi.png", "real"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text('Humi : 50℃ ', style: TextStyle(fontSize: 40),),
                  ],
                ),
              ),
            ),
            drawer: CustomDrawer(),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: CustomNavBar(
                home: false,
                temp: true,
                light: false,
                humi: false,
              )),
        ],
      ),
    );
  }
}
