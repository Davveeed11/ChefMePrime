import 'package:chefmeprime/pages/proflie.dart';
import 'package:chefmeprime/pages/userprofile.dart';
import 'package:chefmeprime/readdata/getuserinfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<String> docId = [];

  Future getDocIds() async {
    await FirebaseFirestore.instance.collection('Users').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docId.add(document.reference.id);
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User page'),centerTitle: true,),
        body: FutureBuilder(
      future: getDocIds(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: docId.length,
          itemBuilder: (context, index) {
            return UserProfiledet(
              feildName: 'username',
              Doc: docId[index],
              ontap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Profiled();
                },),);
              },
            );
          },
        );
      },
    ));
  }
}
