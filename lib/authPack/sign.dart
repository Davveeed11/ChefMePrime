import 'package:chefmeprime/authPack/LoginOrSignUp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../base/res/style/app_styles.dart';
import '../components/Button.dart';
import '../components/backButton.dart';
import '../helperfunction/displayMessageUser.dart';
import '../components/textfeild.dart';

class SignUp extends StatefulWidget {
  final void Function()? tap;

  const SignUp({super.key, this.tap});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController Emailcontroller = TextEditingController();
  final TextEditingController Pwcontroller = TextEditingController();
  final TextEditingController cpwController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  void registerUser() async {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    if (Pwcontroller.text != cpwController.text) {
      Navigator.pop(context);
      displayMessageUser('Passwords do not match', context);
    }

    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Emailcontroller.text,
        password: Pwcontroller.text,
      );
      createUserDocument(userCredential);
      if (context.mounted) Navigator.pop(context);

      displayMessageUser('User created successfully!', context);
      Navigator.pop(context);

      // Close the progress dialog
    } on FirebaseException catch (e) {
      Navigator.pop(context);
      displayMessageUser(e.message.toString(), context);
    }
  }

  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (UserCredential != null && userCredential?.user != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential!.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': userNameController.text,
        'bio': bioController.text,

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            SizedBox(
              height: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Hi There",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    wordSpacing: 2,
                  ),
                ),
                const Text(
                  "Fill in your details",
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      wordSpacing: 2,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                MyTextField(
                  hintText: "User name",
                  iconData: Icons.person,
                  controller: userNameController,
                  obscure: false,
                ),
                MyTextField(
                  hintText: "bio",
                  iconData: Icons.person_2_outlined,
                  controller: bioController,
                  obscure: false,
                ),
                MyTextField(
                  hintText: "Enter your Email",
                  iconData: Icons.person,
                  controller: Emailcontroller,
                  obscure: false,
                ),
                MyTextField(
                  hintText: "Enter Password",
                  iconData: Icons.security,
                  controller: Pwcontroller,
                  obscure: true,
                ),
                MyTextField(
                  hintText: "Confirm Password",
                  iconData: Icons.security,
                  controller: cpwController,
                  obscure: true,
                ),
                SizedBox(
                  height: 40,
                ),
                Button(
                  title: 'Sign In',
                  tap: registerUser,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?  ",
                    ),
                    InkWell(
                        child: Text(
                          "sign in",
                          style: AppStyle.textStyle
                        ),
                        onTap: widget.tap)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
