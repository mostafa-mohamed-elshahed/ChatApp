import 'package:chatapp/constants.dart';
import 'package:chatapp/features/signup/SignUpView/Componets/body.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  static String id = "sign up view";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBackground,
      body: SignupBody(),
    );
  }
}
