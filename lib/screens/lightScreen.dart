import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:gbpl_2023/const/colors.dart';
import 'package:gbpl_2023/utils/helper.dart';
import 'package:gbpl_2023/widgets/customDrawer.dart';
import 'package:gbpl_2023/widgets/customNavBar.dart';
import 'package:gbpl_2023/widgets/customTopBar.dart';

class LightScreen extends StatefulWidget {
  const LightScreen({Key? key}) : super(key: key);
  static const routeName = "/lightScreen";

  @override
  State<LightScreen> createState() => _LightScreenState();
}

class _LightScreenState extends State<LightScreen> {
  bool status = false;
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
                backgroundColor: AppColor.blue,),

            ),
            body: Container(
              width: Helper.getScreenWidth(context),
              height: Helper.getScreenHeight(context),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 60,),
                    Text("Light", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColor.blue),),
                    status
                        ? Icon(Icons.lightbulb, size: 120, color: AppColor.blue,)
                        : Icon(Icons.lightbulb_outline, size: 120, color: AppColor.primary,),
                    SizedBox(height: 10,),
                    CustomSwitch(
                      activeColor: AppColor.blue,
                      value: status,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          status = value;
                        });
                      },
                    ),
                    SizedBox(height: 12.0,),
                    Text('Value : $status', style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0
                    ),)
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
                temp: false,
                light: true,
                humi: false,
              )),
        ],
      ),
    );
  }
}
