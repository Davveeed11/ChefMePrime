import 'package:chefmeprime/base/res/style/app_styles.dart';
import 'package:chefmeprime/components/Button.dart';
import 'package:chefmeprime/components/backButton.dart';
import 'package:chefmeprime/components/textfeild.dart';
import 'package:chefmeprime/helperfunction/displayMessageUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPwPage extends StatefulWidget {
  const ForgotPwPage({super.key});

  @override
  State<ForgotPwPage> createState() => _ForgotPwPageState();
}

class _ForgotPwPageState extends State<ForgotPwPage> {
  final TextEditingController fpwController = TextEditingController();
Future passwordReset()async{
  try {
    FirebaseAuth.instance.sendPasswordResetEmail(
      email: fpwController.text.trim(),
    );
  }on FirebaseException catch(e){
    showDialog(context: context, builder: (context) {
      return AlertDialog(content: Text(e.message.toString()),);
    },);
  }

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reset Password",
        ),centerTitle: true,backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Text('Trouble sigining in?',style: AppStyle.headlineStyle3.copyWith(color: Colors.black),),
            ),
            const Center(
              child: Text(
                "Enter email and reset your password ",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 14,),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: MyTextField(
                hintText: "Enter Email",
                iconData: Icons.security,
                controller: fpwController,
                obscure: false,
              ),
            ),
            SizedBox(
              height: 25,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Button(title: 'reset', tap: passwordReset),
          )

          ],
        ),
      ),
    );
  }
}
