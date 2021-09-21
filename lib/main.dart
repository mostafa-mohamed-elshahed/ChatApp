import 'package:chatapp/features/chat/chatView.dart';
import 'package:chatapp/features/login/loginView/loginView.dart';
import 'package:chatapp/features/signup/SignUpView/signView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginView.id,
      routes: {
        LoginView.id: (context) => LoginView(),
        SignUp.id: (context) => SignUp(),
        ChatView.id: (context) => ChatView(),
      },
    );
  }
}
