import 'package:chefmeprime/authPack/forgotPW.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../base/res/style/app_styles.dart';
import '../components/Button.dart';
import '../components/textfeild.dart';
import '../helperfunction/displayMessageUser.dart';

class Login extends StatefulWidget {
  final void Function()? tap;

  const Login({super.key, this.tap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController Emailcontroller = TextEditingController();
  final TextEditingController Pwcontroller = TextEditingController();

  Future<void> Login() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            strokeWidth: 4,
            color: Colors.grey,
          ),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: Emailcontroller.text.trim(),
        password: Pwcontroller.text.trim(),
      );
      if (context.mounted) Navigator.pop(context);
    } on FirebaseException catch (e) {
      Navigator.pop(context);
      displayMessageUser(e.message.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              SizedBox(
                height: 140,
              ),
              Column(
                children: [
                  Text(
                    "Welcome back",
                    style: AppStyle.headlineStyle2.copyWith(
                      fontSize: 30,
                    ),
                  ),
                  const Text(
                    "Login into your Account",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      wordSpacing: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
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
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ForgotPwPage();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "forgot password?",
                        style: AppStyle.headlineStyle2.copyWith(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Button(
                  title: 'Sign In',
                  tap: Login,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                  ),
                  InkWell(
                      child: Text(
                        "sign up",
                        style: AppStyle.textStyle.copyWith(),
                      ),
                      onTap: widget.tap)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
