import 'package:chefmeprime/components/Button.dart';
import 'package:chefmeprime/pages/user.dart';
import 'package:chefmeprime/drawlist/Account%20page.dart';
import 'package:chefmeprime/screen/bugpage.dart';
import 'package:chefmeprime/screen/feedback.dart';
import 'package:chefmeprime/screen/notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(

            height: 130,
            width: 800,
            child: const SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 18.0),
                        child: Text(
                          'Settings',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Container(
              child: Column(
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 18.0),
                        child: Text(
                          "General",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      children: [
                        ListTile(
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          leading: const Icon(Icons.person),
                          style: ListTileStyle.drawer,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AccountDetails(),
                                ));
                          },
                          trailing: const Icon(
                            Icons.keyboard_arrow_right_sharp,
                          ),
                          title: const Text(
                            'Account',
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const Divider(),


                  Container(
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      children: [
                        ListTile(
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          leading: const Icon(Icons.person),
                          style: ListTileStyle.drawer,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const UserPage(),
                                ));
                          },
                          trailing: const Icon(
                            Icons.keyboard_arrow_right_sharp,
                          ),
                          title: const Text(
                            'Users',
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 18.0),
                        child: Text(
                          "FEEDBACK",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      children: [
                        ListTile(
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          leading: const Icon(Icons.feedback_outlined),
                          style: ListTileStyle.drawer,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const Bugpage();
                              },
                            ),
                            );
                          },
                          trailing: const Icon(
                            Icons.keyboard_arrow_right_sharp,
                          ),
                          title: const Text(
                            'Report a bug',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),

                  Container(
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      children: [
                        ListTile(
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          leading: const Icon(Icons.report),
                          style: ListTileStyle.drawer,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const Feedbacktalk();
                            },));
                          },
                          trailing: const Icon(
                            Icons.keyboard_arrow_right_sharp,
                          ),
                          title: const Text(
                            'Send feedback',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 50,),
          Button(title: "log out", tap: () {
            FirebaseAuth.instance.signOut();

          },),
          const Spacer()
        ],
      ),
    );
  }
}
