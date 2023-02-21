import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class InsertData extends StatefulWidget {
  const InsertData({Key? key}) : super(key: key);

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {

  final  tempController = TextEditingController();
  final  humiController= TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Datas');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Let Us Know Your Experience...',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: tempController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter Your name',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: humiController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Comments',
                    hintText: 'Enter Your Comments',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    Map<String, String> datas = {
                      'name': tempController.text,
                      'comments': humiController.text,
                    };

                    dbRef.push().set(datas);

                  },
                  child: const Text('Send'),
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