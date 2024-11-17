import 'package:flutter/material.dart';


class Listpop extends StatelessWidget {
  const Listpop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(onTap: () {

        },title: Text('Log Out'),tileColor: Colors.red,),
      ],
    );
  }
}
