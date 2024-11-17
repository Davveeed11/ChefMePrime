// ignore_for_file: unused_import

import 'package:chefmeprime/auth/auth.dart';
import 'package:chefmeprime/auth/login%20or%20register.dart';
import 'package:chefmeprime/authPack/introscreen.dart';
import 'package:chefmeprime/theme/apptheme.dart';
import 'package:chefmeprime/theme/light.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'authPack/LoginOrSignUp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    runApp(const MyApp());
  } catch (error) {
    print("Error initializing Firebase: $error");
    // Handle the error gracefully (e.g., show a user-friendly message)
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightmode,
      home: SafeArea(
        child: const AuthPage(),
      ),
    );
  }
}
