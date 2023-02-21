import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gbpl_2023/const/colors.dart';
import 'package:gbpl_2023/utils/helper.dart';
import 'package:gbpl_2023/widgets/customDrawer.dart';
import 'package:gbpl_2023/widgets/customNavBar.dart';
import 'package:intl/intl.dart';
import '../widgets/customTopBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String formattedTime = DateFormat('kk:mm:ss').format(DateTime.now());
  String hour = DateFormat('a').format(DateTime.now());
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) => _update());
  }

  void _update() {
    setState(() {
      formattedTime = DateFormat('kk:mm:ss').format(DateTime.now());
      hour = DateFormat('a').format(DateTime.now());
    });
  }


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
                        tooltip: MaterialLocalizations.of(context)
                            .openAppDrawerTooltip,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50,),
                    Text("Clock", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 46,
                      color: AppColor.primary
                    ),),
                    SizedBox(height: 10,),
                    Icon(Icons.watch_later_outlined, size: 160,color: AppColor.primary),
                    SizedBox(height: 10,),
                    Center(
                        child: Text(
                          formattedTime,
                          textAlign: TextAlign.center,
                          style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 32.0,color: AppColor.blue),)),
                    SizedBox(height: 10,),
                    Text("Timezone", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: AppColor.primary
                    ),),
                    SizedBox(height: 10,),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Row(
                        children: [
                          Icon(Icons.date_range, size: 40, color: AppColor.primary,),
                          SizedBox(width: 10,),
                          Text(
                            "UTC + 7",
                            style: TextStyle(fontSize: 20.0,),
                          ),
                        ],
                      ),
                    ),
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
                home: true,
                temp: false,
                light: false,
                humi: false,
              )),
        ],
      ),
    );
  }
}
