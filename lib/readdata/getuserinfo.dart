import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class getUserName extends StatelessWidget {
  final String documentId;
  final String feildName;
  const getUserName({super.key, required this.documentId, required this.feildName});

  @override
  Widget build(BuildContext context) {
    CollectionReference user = FirebaseFirestore.instance.collection('Users');
    return  FutureBuilder<DocumentSnapshot>(future: user.doc(documentId).get(), builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String,dynamic> data= snapshot.data!.data() as Map<String,dynamic>;
        return Text('${data[feildName]}');
      }
      return const Text('loading ....');
      }
    );
  }
}
