import 'package:chefmeprime/base/res/style/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  final String linkedinPage =
      'https://www.linkedin.com/in/david-idio-477b221b3?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app';
  final String myIntro =
      """Hi My name is David, nice to meet you. I hope you enjoy my app as you can see it's the build so expect it to get better with time. My goal is to be a great Developer one that can contend with our google folks""";
  final String xLink = 'https://x.com/GeeIdio?t=Qw_ilbr_lLVyf-Kf_S45qg&s=09';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),        backgroundColor: Theme.of(context).colorScheme.primary,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 8,),
                              ClipOval(child: Image.asset("assets/APPLOGO1.png",height: 60,),),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "ChefMe",
                            style: AppStyle.headlineStyle1
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "1.0.0",
                            style: AppStyle.headlineStyle1
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                       Text(
                        """This app helps users share recipes with easy steps and connect. This way even you too can be chef on the level of sanji""",
                        softWrap: true,
                        maxLines: null,style: AppStyle.textStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                height: 225,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  color: Colors.grey,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: CircleAvatar(
                            child: Icon(
                              Icons.person_2,
                              size: 30,
                              color: Colors.black,
                            ),
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "David Daniel",
                          style: AppStyle.headlineStyle3.copyWith(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(myIntro,style: AppStyle.textStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w400),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: GestureDetector(
                            onTap: () async {
                              final Uri uri = Uri.parse(xLink);
                              if (await canLaunchUrl(uri)) {
                                launchUrl(uri);
                              }
                            },
                            child: Image.asset(
                              'assets/x.png',
                            ),
                          ),
                          maxRadius: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: GestureDetector(
                            onTap: () async {
                              final Uri uri = Uri.parse(linkedinPage);
                              if (await canLaunchUrl(uri)) {
                                launchUrl(uri);
                              }
                            },
                            child: Image.asset(
                              'assets/linkedin.png',
                            ),
                          ),
                          maxRadius: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height:287,),
          ],
        ),
      ),
    );
  }
}
