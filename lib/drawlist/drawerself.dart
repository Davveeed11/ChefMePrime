import 'package:chefmeprime/drawlist/Account%20page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/Button.dart';
import 'About.dart';
import 'helpFeedback.dart';

class DrawerSelf extends StatelessWidget {
  const DrawerSelf({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return  Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          CircleAvatar(
            child: Text(user!.email!.split('@').first),
            maxRadius: 50,
            backgroundColor: Theme.of(context).colorScheme.secondary,

          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.person),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AccountDetails();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: Text('Help & feedback'),
            leading: Icon(Icons.help),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HelpFeedback();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: Text('About'),
            leading: Icon(Icons.help),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return About();
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: 350,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Button(
              title: 'Log out',
              tap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('Are you sure?')]),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('no',style: TextStyle(color: Colors.black),),
                            ),
                            SizedBox(width: 5,),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                FirebaseAuth.instance.signOut();
                              },
                              child: Text('yes',style: TextStyle(color: Colors.red),),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(onTap: () {}, child: Text('Policy')),
              SizedBox(
                width: 10,
              ),
              Text('.'),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Text('Terms and condition'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
