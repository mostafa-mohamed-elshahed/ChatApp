import 'package:chatapp/helper/SizeConfig.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String txt;
  CustomButton({@required this.onTap, @required this.txt});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.defaultSize * 5,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            txt,
            style: TextStyle(fontSize: SizeConfig.defaultSize * 2),
          ),
        ),
      ),
    );
  }
}
