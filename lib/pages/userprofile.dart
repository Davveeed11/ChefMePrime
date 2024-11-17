import 'package:flutter/material.dart';

import '../readdata/getuserinfo.dart';

class UserProfiledet extends StatefulWidget {
  final String Doc;
  final String feildName;
  final void Function()? ontap;

  const UserProfiledet(
      {super.key,
      required this.Doc,
      required this.feildName,
      required this.ontap});

  @override
  State<UserProfiledet> createState() => _UserProfiledetState();
}

class _UserProfiledetState extends State<UserProfiledet> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: getUserName(
        documentId: widget.Doc,
        feildName: widget.feildName,
      ),
      onTap: widget.ontap,
    );
  }
}
