import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../utils/helper.dart';

class FanScreen extends StatefulWidget {
  const FanScreen({Key? key}) : super(key: key);

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

  bool status = false;


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
      body: Column(
        children: [
          SizedBox(height: 60,),
          Text("Fan", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColor.blue),),
          status ?
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
            value: status,
            onChanged: (value) {
              print("VALUE : $value");
              setState(() {
                status = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
