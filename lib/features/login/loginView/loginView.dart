import 'package:chatapp/constants.dart';
import 'package:chatapp/features/login/loginView/componets/body.dart';
import 'package:chatapp/helper/SizeConfig.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  static String id = "Login View";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: KBackground,
      body: LoginViewBody(),
    );
  }
}
