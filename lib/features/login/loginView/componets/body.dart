import 'package:chatapp/Components/CustomButton.dart';
import 'package:chatapp/Components/LogoWidget.dart';
import 'package:chatapp/Components/TextFieldCustom.dart';
import 'package:chatapp/constants.dart';
import 'package:chatapp/features/chat/chatView.dart';
import 'package:chatapp/features/signup/SignUpView/signView.dart';
import 'package:chatapp/helper/SizeConfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginViewBody extends StatefulWidget {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  _LoginViewBodyState createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  String email;
  String password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          autovalidateMode: _autoValidateMode,
          key: LoginViewBody._formKey,
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.defaultSize * 7,
              ),
              LogoWidget(),
              SizedBox(height: SizeConfig.defaultSize * 7),
              Row(
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.defaultSize * 4,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.defaultSize,
              ),
              CustomTextField(
                onSaved: (value) {
                  email = value;
                },
                hint: "Email",

              ),
              SizedBox(
                height: SizeConfig.defaultSize * 2,
              ),
              CustomTextField(
                onSaved: (value) {
                  password = value;
                },
                hint: "password",
                obscureText: true,
              ),
              SizedBox(
                height: SizeConfig.defaultSize * 2,
              ),
              CustomButton(
                txt: "Log in",
                onTap: () async {
                  await Loginuser(context: context);
                },
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",
                      style: TextStyle(color: Colors.white)),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignUp.id);
                      },
                      child: Text(
                        "sign Up",
                        style: TextStyle(color: Colors.grey),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future Loginuser({BuildContext context}) async {
    if (LoginViewBody._formKey.currentState.validate()) {
      LoginViewBody._formKey.currentState.save();
      try {
        UserCredential user = await _auth.signInWithEmailAndPassword(
            email: email.trim(), password: password.trim());
        LoginViewBody._formKey.currentState.reset();

        Navigator.pushNamed(context, ChatView.id, arguments: user.user.uid);
      } catch (ex) {
        var snackbar = SnackBar(content: Text(ex.toString()));
        Scaffold.of(context).showSnackBar(snackbar);
      }
    } else {
      setState(() {});
      _autoValidateMode = AutovalidateMode.onUserInteraction;
    }
  }
}
