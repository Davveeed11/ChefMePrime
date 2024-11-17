import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth/crud.dart';

class Views extends StatefulWidget {
  const Views({super.key});

  @override
  State<Views> createState() => _ViewsState();
}

class _ViewsState extends State<Views> {
  final user = FirebaseAuth.instance.currentUser;
  FirestoreService firestoreService = FirestoreService();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestoreService.getMealStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.hasData) {
          List mealList = snapshot.data!.docs;

          return ListView.builder(
            itemCount: mealList.length,
            itemBuilder: (context, index) {
              DocumentSnapshot meal = mealList[index];
              String docId = meal.id;
              Map<String, dynamic> data = meal.data() as Map<String, dynamic>;
              dynamic description = data['description']; // Access as dynamic

              if (description is String) {
                String mealText = description;
                return ListTile(title: Text(mealText));
              } else {
                // Handle the case where description is not a string
                return Text('Description is not a string');
              }
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
