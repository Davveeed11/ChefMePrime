import 'package:chefmeprime/base/res/style/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpFeedback extends StatefulWidget {
  const HelpFeedback({super.key});

  @override
  State<HelpFeedback> createState() => _HelpFeedbackState();
}

class _HelpFeedbackState extends State<HelpFeedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(        backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,

        body: Column(
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 8),
              child: Text(
                """If you have an idea on how to improve this app you can drop an email by clicking the button and we will see to it that it is improved. Thanks.""",
                style: AppStyle.headlineStyle1.copyWith(color: Colors.black87),
              ),
            ),
            SizedBox(height: 20,),

            Center(
              child: MaterialButton(
                onPressed: () async {
                  String? encodeQueryParameters(Map<String, String> params) {
                    return params.entries
                        .map((MapEntry<String, String> e) =>
                            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                        .join('&');
                  }

                  final Uri emailUri = Uri(
                      scheme: 'mailto',
                      path: 'drizzy2908@gmail.com',
                      query: encodeQueryParameters(<String, String>{}));
                  try {
                    await launchUrl(emailUri);
                  } catch (e) {
                    print(e.toString());
                  }
                },
                child: Text("FeedBack"),
                color: Colors.grey,
                padding: EdgeInsets.all(15),
              ),
            ),
          ],
        ));
  }
}
