import 'package:chefmeprime/auth/crud.dart';
import 'package:chefmeprime/base/res/style/app_styles.dart';
import 'package:chefmeprime/components/TextBoxInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final TextEditingController editingController = TextEditingController();
    final userCollection = FirebaseFirestore.instance.collection('Users');

    Future<void> editField(String field) async {
      String newValue = "";

      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit' + field),
            content: TextField(
              controller: editingController,
              autofocus: true,
              onChanged: (value) {
                newValue = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
              ),
            ),
            actions: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('No'),
                  ),
                  SizedBox(width: 5,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(newValue);
                      editingController.clear();
                    },
                    child: Text('Yes'),
                  ),

                ],
              )
            ],
          );
        },
      );
      if (newValue.trim().length > 0) {
        await userCollection.doc(user!.email).update({field: newValue});
      }
    }

    final FirestoreService firebaseService = FirestoreService();

    return Scaffold(
      appBar: AppBar(
        title: Text('User Account'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Users')
                  .doc(user?.email) // Use null-safe access
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else if (snapshot.hasData) {
                  if (snapshot.data!.exists) {
                    final userdata =
                        snapshot.data!.data() as Map<String, dynamic>;
                    return Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          CircleAvatar(
                            maxRadius: 40,
                            backgroundColor: Colors.white,
                            child: Icon(
                              FluentSystemIcons.ic_fluent_person_filled,
                              size: 60,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Textboxinfo(
                            fieldName: 'username',
                            UserName: userdata['username'],
                            ontap: () => editField('username'),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Textboxinfo(
                            fieldName: 'Bio',
                            UserName: userdata['bio'],
                            ontap: () => editField('bio'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(child: Text('User not found'));
                  }
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
           SizedBox(height: 10,),
           Row(
             children: [
               SizedBox(width: 8,),
               Expanded(
                 child: Container(
                   child: Padding(
                     padding: const EdgeInsets.only(left: 12.0),
                     child: Text('My post',style: AppStyle.textStyle.copyWith(fontSize: 15,fontStyle: FontStyle.normal),),
                   ),
                 ),
               ),
               SizedBox(width: 20,)

             ],
           ),
           Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:6),
              child:
            StreamBuilder<QuerySnapshot>(
              stream: firebaseService.getMealStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List mealList = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: mealList.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot blah = mealList[index];
                      Map<String, dynamic> data =
                      blah.data() as Map<String, dynamic>;
                      String noteText = data['meal'];
                      String subName = data['userName'];
                      String id = blah.id;
                      return ListTile(
                        title: Text(noteText),
                        subtitle: Text(subName),
                        trailing: GestureDetector(onTap: () {
                          firebaseService.deleteNotes(id);
                        },child: Icon(Icons.delete)),
                      );
                    },
                  );
                } else{
                  return CircularProgressIndicator();
                }
              },
            ),),
          ),
        ],
      ),
    );
  }
}
