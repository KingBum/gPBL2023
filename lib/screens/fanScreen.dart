import 'package:custom_switch/custom_switch.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../utils/helper.dart';

class FanScreen extends StatefulWidget {
  const FanScreen({Key? key}) : super(key: key);

  final String studentKey = "-NOnKk57mJP5vQhTDm7h";

  @override
  State<FanScreen> createState() => _FanScreenState();
}

class _FanScreenState extends State<FanScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500 ),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  final vlRef = FirebaseDatabase.instance.ref().child("Datas/-NOnKk57mJP5vQhTDm7h");

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          Text("Fan", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColor.blue),),
          student['isFan'] ?
          Center(
            child: RotationTransition(
              turns: _animation,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Image.asset(
                  Helper.getAssetName("fan.png", "real"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          )
              : Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                Helper.getAssetName("fan.png", "real"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          CustomSwitch(
            activeColor: AppColor.blue,
            value: student['isFan'],
            onChanged: (value) {
              vlRef.update({
                "isFan": !student['isFan'],
              });
              print("VALUE : $student['isFan']");
            },
          ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.blue,
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: 10,),
            Text(
              "Fan System",
            ),
          ],
        ),
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
    );
  }
}
