import 'package:flutter/material.dart';
import 'package:gbpl_2023/const/colors.dart';
import 'package:gbpl_2023/utils/helper.dart';
import 'package:gbpl_2023/widgets/customDrawer.dart';
import 'package:gbpl_2023/widgets/customNavBar.dart';
import 'package:gbpl_2023/widgets/customTopBar.dart';

class HumiScreen extends StatelessWidget {
  const HumiScreen({Key? key}) : super(key: key);
  static const routeName = "/humiScreen";

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
                  backgroundColor: Colors.blue),

            ),
            body: Container(
              width: Helper.getScreenWidth(context),
              height: Helper.getScreenHeight(context),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          color:  AppColor.backgrtext,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "What’s the weather?", style: TextStyle(color: AppColor.primary),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          child: Image.asset(
                            Helper.getAssetName("Ai.png", "real"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          color:  AppColor.backgrtext,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Da Nang, 23℃", style: TextStyle(color: AppColor.primary),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          color:  AppColor.backgrtext,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Are you alive?", style: TextStyle(color: AppColor.primary),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          child: Image.asset(
                            Helper.getAssetName("Ai.png", "real"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          color:  AppColor.backgrtext,
                          width: 250,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "I’m not sure.  But my creators "
                                "struggied to create me useful.", style: TextStyle(color: AppColor.primary),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 80,),
                    Container(
                      width: 350,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16, left: 16),
                        child: const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter your question here...',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            drawer: CustomDrawer(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 560.0),
            child: CustomNavBar(
              home: false,
              temp: false,
              light: false,
              humi: true,
            ),
          ),

        ],
      ),
    );
  }
}
