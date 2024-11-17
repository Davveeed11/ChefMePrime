import 'package:chefmeprime/base/res/style/app_styles.dart';
import 'package:chefmeprime/components/Button.dart';
import 'package:flutter/material.dart';

import '../components/textfeild.dart';

class Feedbacktalk extends StatelessWidget {
  const Feedbacktalk({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fbController = TextEditingController();
    return Scaffold(
backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: Text('Feed back'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'What are your thoughts on the app? ',
                  style: AppStyle.headlineStyle1.copyWith(color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            MyTextField(
              hintText: 'Send your feed back',
              obscure: false,
              controller: fbController,
              iconData: Icons.feedback_outlined,
            ),
            SizedBox(
              height: 15,
            ),
            Button(
              title: 'send',
              tap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
