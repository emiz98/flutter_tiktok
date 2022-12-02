import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tiktok/pages/home.dart';
import 'package:flutter_tiktok/pages/inbox.dart';
import 'package:flutter_tiktok/pages/profile.dart';
import 'package:flutter_tiktok/pages/search.dart';
import 'package:flutter_tiktok/theme/colors.dart';
import 'package:flutter_tiktok/widgets/tik_tok_icons.dart';
import 'package:flutter_tiktok/widgets/upload_icon.dart';
import 'package:lottie/lottie.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  bool starterLoading = true;

  @override
  void initState() {
    super.initState();
    delay();
  }

  delay() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        starterLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(child: LayoutBuilder(builder: (context, constraints) {
      return starterLoading
          ? Lottie.asset('assets/lottie/starter.json')
          : Scaffold(
              bottomNavigationBar: getFooter(),
              body: getBody(),
            );
    }));
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        Home(),
        Search(),
        Center(
          child: Text(
            "Upload",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: black),
          ),
        ),
        Inbox(),
        Profile()
      ],
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    List bottomItems = [
      {"icon": TikTokIcons.home, "label": "Home", 'isIcon': true},
      {"icon": TikTokIcons.search, "label": "Discover", 'isIcon': true},
      {"icon": "", "label": "", 'isIcon': false},
      {"icon": Icons.messenger_outline, "label": "Inbox", 'isIcon': true},
      {"icon": TikTokIcons.profile, "label": "Me", 'isIcon': true}
    ];

    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(color: appBgColor),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return bottomItems[index]['isIcon']
                ? InkWell(
                    onTap: () {
                      selectedIndex(index);
                    },
                    child: Column(
                      children: [
                        Icon(
                          bottomItems[index]['icon'],
                          color: white,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          bottomItems[index]['label'],
                          style: TextStyle(color: white, fontSize: 10),
                        )
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      selectedIndex(index);
                    },
                    child: UploadIcon());
          }),
        ),
      ),
    );
  }

  selectedIndex(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
