import 'dart:async';

import 'package:chefmeprime/components/Button.dart';
import 'package:chefmeprime/helperfunction/displayMessageUser.dart';
import 'package:chefmeprime/screen/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../base/res/style/app_styles.dart';
import '../pages/home.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationCode();
      timer = Timer.periodic(
        Duration(seconds: 4),
        (timer) => checkEmailVef(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVef() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
  }

  Future sendVerificationCode() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() => canResendEmail=false);
      await Future.delayed(Duration(seconds: 5),);
    } catch (e) {
      displayMessageUser(e.toString(), context);
    }
    if (isEmailVerified) timer?.cancel();
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const HomePage()
      : Scaffold(

          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Verification Page",
              style: AppStyle.headlineStyle1.copyWith(color: Colors.black87),
            ),
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Text(
                  "Verification email has been sent",
                  style: AppStyle.headlineStyle1.copyWith(
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Check your email and verify",
                  style: AppStyle.headlineStyle1.copyWith(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 30,),
                Button(
                  title: "Resend Email",
                  tap: sendVerificationCode,
                ),
              ],
            ),
          ),
        );
}
