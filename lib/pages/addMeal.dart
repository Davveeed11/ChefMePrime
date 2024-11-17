import 'package:chefmeprime/components/textfeild.dart';
import 'package:flutter/material.dart';

import '../auth/crud.dart';
import '../components/Button.dart';

class Addmeal extends StatefulWidget {
  const Addmeal({super.key});

  @override
  State<Addmeal> createState() => _AddmealState();
}

class _AddmealState extends State<Addmeal> {
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController ingredentsEditingController = TextEditingController();
  final TextEditingController descriptEditingController = TextEditingController();
  final TextEditingController usernameEditingController = TextEditingController();
  final TextEditingController stepEditor = TextEditingController();


  final FirestoreService firebaseService = FirestoreService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,

      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),

              // meal pic
              CircleAvatar(
                child: Icon(Icons.person,size: 40,),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                maxRadius: 40,
              ),
              SizedBox(
                height: 5,
              ),
              //food text feild
              MyTextField(
                hintText: 'meal name',
                iconData: Icons.cookie,
                obscure: false,
                controller: nameEditingController,
              ),
              SizedBox(height: 5,),
              MyTextField(
                hintText: 'username',
                iconData: Icons.cookie,
                obscure: false,
                controller: usernameEditingController,
              ),
              SizedBox(height: 5,),
              // description
              MyTextField(
                hintText: 'ingredents',
                iconData: Icons.info,
                obscure: false,
                controller: ingredentsEditingController,

              ),
              MyTextField(
                hintText: 'Steps',
                iconData: Icons.info,
                obscure: false,
                controller: stepEditor,

              ),
              MyTextField(
                hintText: 'meal description',
                iconData: Icons.info,
                obscure: false,
                controller: descriptEditingController,

              ),
              SizedBox(height: 30),
              Button(title: "post",tap: () {
                firebaseService.addmeal(nameEditingController.text,descriptEditingController.text,ingredentsEditingController.text,usernameEditingController.text,stepEditor.text);
                nameEditingController.clear();
                descriptEditingController.clear();
                Navigator.pop(context);
              },),

            ],
          ),
        ),
      ),
    );
  }
}
