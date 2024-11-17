import 'package:chefmeprime/base/res/style/appMedia.dart';
import 'package:chefmeprime/base/res/style/app_styles.dart';
import 'package:chefmeprime/components/Button.dart';
import 'package:chefmeprime/components/mealview.dart';
import 'package:chefmeprime/components/textview.dart';
import 'package:chefmeprime/drawlist/drawerself.dart';
import 'package:chefmeprime/drawlist/helpFeedback.dart';
import 'package:chefmeprime/pages/addMeal.dart';
import 'package:chefmeprime/pages/user.dart';
import 'package:chefmeprime/drawlist/About.dart';
import 'package:chefmeprime/drawlist/Account%20page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth/crud.dart';
import '../components/topheader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> docId = [];
  final FirestoreService firebaseService = FirestoreService();

  Future getDocIds() async {
    await FirebaseFirestore.instance.collection('Users').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      drawer: DrawerSelf(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: StreamBuilder<QuerySnapshot>(
                stream: firebaseService.getMealStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List mealList = snapshot.data!.docs;

                    return GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mealList.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot = mealList[index];
                        String DocId = documentSnapshot.id;
                        Map<String, dynamic> data =
                            documentSnapshot.data() as Map<String, dynamic>;
                        String noteText = data['meal'];
                        String username = data['userName'];
                        String ingredents = data['ingredents'];
                        String description = data['description'];
                        String procedure = data['Steps'];
                        return mealview(
                          mealName: noteText,
                          username: username,
                          ingredent: ingredents,
                          description: description, steps: procedure,

                        );
                      }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 250),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator(),);
                  }
                },
              ),
            ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const Addmeal(

                );
              },
            ),
          );
        },
        child: Image.asset(
          "assets/pen-creative-art-supply-icon.png",
          height: 30,
          color: Colors.black,
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
