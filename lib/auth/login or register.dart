import 'package:chefmeprime/authPack/LoginOrSignUp.dart';
import 'package:chefmeprime/authPack/sign.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  void toggleSwitch(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
}
  @override
  Widget build(BuildContext context) {
   if(showLoginPage){
     return Login(tap: toggleSwitch,);
   }else{
     return SignUp(tap: toggleSwitch,);
   }
  }
}
