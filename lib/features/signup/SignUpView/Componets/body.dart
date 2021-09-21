import 'package:chatapp/Components/CustomButton.dart';
import 'package:chatapp/Components/LogoWidget.dart';
import 'package:chatapp/Components/TextFieldCustom.dart';
import 'package:chatapp/helper/SizeConfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupBody extends StatefulWidget {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  _SignupBodyState createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          autovalidateMode: _autoValidateMode,
          key: SignupBody._formKey,
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
                    "Sign Up",
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
                  _email = value;
                },
                hint: "Email",
              ),
              SizedBox(
                height: SizeConfig.defaultSize * 2,
              ),
              CustomTextField(
                onSaved: (value) {
                  _password = value;
                },
                hint: "password",
              ),
              SizedBox(
                height: SizeConfig.defaultSize * 2,
              ),
              CustomButton(
                txt: "Sign Up",
                onTap: () async {
                  await createuser();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future createuser() async {
    if (SignupBody._formKey.currentState.validate()) {
      SignupBody._formKey.currentState.save();
      await _auth.createUserWithEmailAndPassword(
          email: _email.trim(), password: _password.trim());
    } else {
      setState(() {});
      _autoValidateMode = AutovalidateMode.onUserInteraction;
    }
  }
}
