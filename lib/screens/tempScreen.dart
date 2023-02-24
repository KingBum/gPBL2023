import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
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
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 100,
            child: Image.asset(
              Helper.getAssetName("humi.png", "real"),
              fit: BoxFit.fill,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Humidity: ",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                student['Humi'].toString(),
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: AppColor.blue),
              ),
              Text(
                " %",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 100,
            child: Image.asset(
              Helper.getAssetName("temp.png", "real"),
              fit: BoxFit.fill,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Temperature: ",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                student['Temp'].toString(),
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold,color: AppColor.blue),
              ),
              Text(
                " °C",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
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
                temp: true,
                light: false,
                humi: false,
              )),
        ],
      ),
    );
  }
}
