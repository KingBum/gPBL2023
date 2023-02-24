import 'package:custom_switch/custom_switch.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
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

  final vlRef = FirebaseDatabase.instance.ref().child("Datas/-NOnKk57mJP5vQhTDm7h");

  Query dbRef = FirebaseDatabase.instance.ref().child('Datas');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Datas');


  Widget listItem({required Map student}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: Helper.getScreenHeight(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 60,),
          Text("Light", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColor.blue),),
          student['isLight'] ?
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
                child: Icon(Icons.lightbulb, size: 130, color: AppColor.blue,)
            ),
          )
              : Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(Icons.lightbulb_outline, size: 130, color: AppColor.blue,)
            ),
          ),
          CustomSwitch(
            activeColor: AppColor.blue,
            value: student['isLight'],
            onChanged: (value) {
              vlRef.update({
                "isLight": !student['isLight'],
              });
              print("VALUE : $student['isLight']");
            },
          ),
        ],
      ),
    );
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
              child: FirebaseAnimatedList(
                query: dbRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

                  Map student = snapshot.value as Map;
                  student['key'] = snapshot.key;

                  return listItem(student: student);

                },
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
