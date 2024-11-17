import 'package:chefmeprime/base/res/style/app_styles.dart';
import 'package:chefmeprime/screen/Info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../base/res/style/appMedia.dart';

class mealview extends StatelessWidget {
  final String mealName;
  final String username;
  final String ingredent;
  final String description;
  final String steps;

  const mealview({
    super.key,
    required this.mealName, required this.username, required this.ingredent, required this.description, required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser;
    final _name = [
      "Spagetti",
      "Burger",
      "cali Fries",
      "Garri and melon",
      "Ice Cream",
    ];

    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Users')
          .doc(user?.email) // Use null-safe access
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()),);
        } else if (snapshot.hasData) {
          final userdata = snapshot.data!.data() as Map<String, dynamic>;
          return  SizedBox(
            width: size.width * 0.45,
            child: Container(
              padding: const EdgeInsets.only(top: 10,left: 2,right: 2,),
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              margin: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Info(
                          mealName: mealName,
                          userName: username,
                          descriptions: description,
                          ingredents: ingredent, steps: steps,

                        );
                      },
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 29,

                  ),
                  decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: AssetImage(
                                  AppMedia.logo,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        mealName,
                        style: AppStyle.textStyle,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
username                      ),

                        ],
                      )


                ),
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
