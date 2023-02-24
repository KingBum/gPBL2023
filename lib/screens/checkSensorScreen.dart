import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'homeScreen.dart';

class CheckSensorScreen extends StatefulWidget {

  const CheckSensorScreen({Key? key}) : super(key: key);

  @override
  State<CheckSensorScreen> createState() => _CheckSensorScreenState();
}

class _CheckSensorScreenState extends State<CheckSensorScreen> {

  final  humiController = TextEditingController();
  final  tempController= TextEditingController();
  final  luxController =TextEditingController();
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

    humiController.text = data['isHumi'];
    tempController.text = data['isTemp'];
    luxController.text = data['isLux'];

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Updating record'),
      ),
      body:  Center(
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
                  height: 30,
                ),
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
                  height: 30,
                ),
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
                  height: 30,
                ),
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

                    Map<String, String> students = {
                      'isHumi': humiController.text,
                      'isTemp': tempController.text,
                      'isLux': luxController.text
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
    );
  }
}