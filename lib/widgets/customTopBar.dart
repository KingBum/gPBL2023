import 'package:flutter/material.dart';
import 'package:gbpl_2023/const/colors.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Row(
          children: [
            Text(
              "Green House",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ],
        ),
      ),
    );
  }
}
