import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(width: 150,height:150 ,
          child: Image(image: AssetImage("assets/images/icon.png",),
          ),
        ),
        Text("ChatApp",style:
        TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.2,
          fontStyle: FontStyle.italic,
        ),)
      ],
    );
  }
}
