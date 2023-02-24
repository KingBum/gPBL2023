import 'package:flutter/material.dart';
import 'package:gbpl_2023/const/colors.dart';
import 'package:gbpl_2023/screens/checkSensorScreen.dart';
import 'package:gbpl_2023/screens/fetch_data.dart';
import 'package:gbpl_2023/screens/insertData.dart';
import 'package:gbpl_2023/screens/waterScreen.dart';

import '../screens/fanScreen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 102,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                color: AppColor.blue,
              ),
              child: Text('Menu', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColor.white),),
            ),
          ),
          ListTile(
            title: Container(
                color: AppColor.backgr,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Home', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: AppColor.blue), textAlign: TextAlign.center,),
                )),
            onTap: () {
              Navigator.pop(context);
            },
          ),ListTile(
            title: Container(
                color: AppColor.backgr,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Temperature', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: AppColor.blue), textAlign: TextAlign.center,),
                )),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FetchData()));
            },
          ),ListTile(
            title: Container(
                color: AppColor.backgr,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Humidity', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: AppColor.blue), textAlign: TextAlign.center,),
                )),
            onTap: () {
              Navigator.pop(context);
            },
          ),ListTile(
            title: Container(
                color: AppColor.backgr,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Watering', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: AppColor.blue), textAlign: TextAlign.center,),
                )),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WaterScreen()));
            },
          ),ListTile(
            title: Container(
                color: AppColor.backgr,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Heater', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: AppColor.blue), textAlign: TextAlign.center,),
                )),
            onTap: () {
              Navigator.pop(context);
            },
          ),ListTile(
            title: Container(
                color: AppColor.backgr,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Fan', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: AppColor.blue), textAlign: TextAlign.center,),
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FanScreen()));
            },
          ),ListTile(
            title: Container(
                color: AppColor.backgr,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Add Limit', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: AppColor.blue), textAlign: TextAlign.center,),
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CheckSensorScreen()));
            },
          ),ListTile(
            title: Container(
                color: AppColor.backgr,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Feedback', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: AppColor.blue), textAlign: TextAlign.center,),
                )),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const InsertData()));
            },
          ),
        ],
      ),
    );
  }
}
