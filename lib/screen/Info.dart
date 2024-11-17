import 'package:chefmeprime/auth/crud.dart';
import 'package:chefmeprime/base/res/style/app_styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  final String mealName;
  final String userName;
  final String ingredents;
  final String descriptions;
  final String steps;

  const Info(
      {super.key,
      required this.mealName,
      required this.userName,
      required this.ingredents,
      required this.descriptions,
      required this.steps});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    FirestoreService firestoreService = FirestoreService();

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          title: Text(mealName),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Chef: ' + userName,
                    style:
                        AppStyle.headlineStyle1.copyWith(color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Ingredents:',
                style: AppStyle.headlineStyle1
                    .copyWith(fontSize: 20, color: Colors.black),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                ingredents,
                style: AppStyle.headlineStyle1.copyWith(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.secondary),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Description:',
                style: AppStyle.headlineStyle1
                    .copyWith(fontSize: 20, color: Colors.black),
              ),
              Text(descriptions,
                  style: AppStyle.headlineStyle1.copyWith(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.secondary)),
              SizedBox(
                height: 10,
              ),
              Text(
                'Procedure:',
                style: AppStyle.headlineStyle1
                    .copyWith(fontSize: 20, color: Colors.black),
              ),
              Text(
                steps,
                style: AppStyle.headlineStyle1.copyWith(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ));
  }
}
