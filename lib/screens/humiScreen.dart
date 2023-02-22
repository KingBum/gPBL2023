import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/utils/language.dart';
import 'package:flutter_dialogflow/v2/auth_google.dart';
import 'package:flutter_dialogflow/v2/dialogflow_v2.dart';
import 'package:gbpl_2023/const/colors.dart';
import 'package:gbpl_2023/utils/helper.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HumiScreen extends StatefulWidget {
  const HumiScreen({Key? key}) : super(key: key);
  static const routeName = "/humiScreen";

  @override
  State<HumiScreen> createState() => _HumiScreenState();
}

class _HumiScreenState extends State<HumiScreen> {

  void response(query) async {
    AuthGoogle authGoogle = await AuthGoogle(
        fileJson: "assets/service.json")
        .build();
    Dialogflow dialogflow =
    Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    setState(() {
      messsages.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
      });
    });


    // print(aiResponse.getListMessage()[0]["text"]["text"][0].toString());
    print(aiResponse.getListMessage());
    print(aiResponse);
  }

  final messageInsert = TextEditingController();
  List<Map> messsages = [];


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
              "Chat bot",
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messsages.length,
                    itemBuilder: (context, index) => chat(
                        messsages[index]["message"].toString(),
                        messsages[index]["data"]))),
            SizedBox(
              height: 20,
            ),

            Container(
              child: ListTile(
                title: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(
                        15)),
                    color: Color.fromRGBO(220, 220, 220, 1),
                  ),
                  padding: EdgeInsets.only(left: 15),
                  child: TextFormField(
                    controller: messageInsert,
                    decoration: InputDecoration(
                      hintText: "Enter a Message...",
                      hintStyle: TextStyle(
                          color: Colors.black26
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),

                    style: TextStyle(
                        fontSize: 16,
                        color: AppColor.primary
                    ),
                    onChanged: (value) {

                    },
                  ),
                ),

                trailing: IconButton(

                    icon: Icon(

                      Icons.send,
                      size: 30.0,
                      color: AppColor.blue,
                    ),
                    onPressed: () {

                      if (messageInsert.text.isEmpty) {
                        print("empty message");
                      } else {
                        setState(() {
                          messsages.insert(0,
                              {"data": 1, "message": messageInsert.text});
                        });
                        response(messageInsert.text);
                        messageInsert.clear();
                      }
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    }),

              ),

            ),

            SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget chat(String message, int data) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),

      child: Row(
        mainAxisAlignment: data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [

          data == 0 ? Container(
            height: 60,
            width: 60,
            child: Image.asset(
              Helper.getAssetName("Ai.png", "real"),
              fit: BoxFit.fill,
            ),
          ) : Container(),

          Padding(
            padding: EdgeInsets.all(10.0),
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  SizedBox(
                    width: 10.0,
                  ),
                  Flexible(
                      child: Container(
                        constraints: BoxConstraints( maxWidth: 200),
                        color: AppColor.backgrtext,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          data == 0
                          ?AnimatedTextKit(
                            isRepeatingAnimation: false,
                            animatedTexts: [
                              TypewriterAnimatedText(message, textStyle: TextStyle(
                                  color: AppColor.primary, fontWeight: FontWeight.bold),),
                            ],
                          )
                          :
                          Text(
                            message,
                            style: TextStyle(
                                color: AppColor.primary, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
