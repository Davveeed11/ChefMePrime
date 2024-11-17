// ignore_for_file: unused_import

import 'package:chefmeprime/auth/login%20or%20register.dart';
import 'package:chefmeprime/authPack/LoginOrSignUp.dart';
import 'package:chefmeprime/authPack/emailverification.dart';
import 'package:chefmeprime/authPack/introscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/home.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const VerifyEmail();
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
