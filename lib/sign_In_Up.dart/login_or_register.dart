import 'package:flutter/material.dart';
import 'package:herlytics/sign_In_Up.dart/register_page.dart';
import 'package:herlytics/sign_In_Up.dart/singIn.dart';


class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
// initially show login page
  bool showLoginPage = true;

  //toogle between login and rester page

  void tooglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
     if(showLoginPage){
      return LoginPage(
        onTap: tooglePages,
      );
     } else {
      return RegisterPage(
        onTap: tooglePages,
      );
     }
  }
}