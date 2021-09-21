import 'package:chatapp/constants.dart';
import 'package:chatapp/features/chat/componets/body.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  static String id = "chat view";
  @override
  Widget build(BuildContext context) {
    String uid = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: KBackground,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                width: MediaQuery.of(context).size.width * .1,
                image: AssetImage("assets/images/icon.png")),
            Text(
              "Chat App",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
      body: ChatViewBody(
        uid: uid,
      ),
    );
  }
}
