import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../utils/helper.dart';
import 'homeScreen.dart';

class CheckSensorScreen extends StatefulWidget {

  const CheckSensorScreen({Key? key}) : super(key: key);

  @override
  State<CheckSensorScreen> createState() => _CheckSensorScreenState();
}

class _CheckSensorScreenState extends State<CheckSensorScreen> {

  final humiController = TextEditingController();
  final tempController= TextEditingController();
  final luxController =TextEditingController();

  var temp1 = 0;
  var humi1 = 0;
  var lux1 = 0;


  final vlRef = FirebaseDatabase.instance.ref().child("Datas/-NOnKk57mJP5vQhTDm7h");

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Datas');
    getStudentData();
  }

  void getStudentData() async {
    DataSnapshot snapshot = await vlRef.get();

    Map data = snapshot.value as Map;

    temp1 = data['isHumi'];
    humi1 = data['isTemp'];
    lux1 = data['isLux'];

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Updating record'),
      ),
      body:  Center(
        child: Container(
          width: Helper.getScreenWidth(context),
          height: Helper.getScreenHeight(context),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Updating data in Firebase Realtime Database',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Current Humi limit : $humi1", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  TextField(
                    controller: humiController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Humi Limit',
                      hintText: 'Enter Number You Want',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Current Temp limit : $temp1", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  TextField(
                    controller: tempController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Temp limit',
                      hintText: 'Enter Number You Want',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Current Lux limit : $lux1", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  TextField(
                    controller: luxController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Lux limit',
                      hintText: 'Enter Number You Want',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: () {

                      Map<String, int> students = {
                        'isHumi': int.parse(humiController.text),
                        'isTemp': int.parse(tempController.text),
                        'isLux': int.parse(luxController.text)
                      };

                      vlRef.update(students)
                          .then((value) => {
                        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName)
                      });

                    },
                    child: const Text('Update Data'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    minWidth: 300,
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}