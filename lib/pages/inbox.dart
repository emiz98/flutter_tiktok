import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tiktok/theme/colors.dart';
import 'package:flutter_tiktok/widgets/NotificationWidget.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 20,
                ),
                Row(
                  children: [
                    Text(
                      "All activity",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                RotationTransition(
                    turns: const AlwaysStoppedAnimation(-30 / 360),
                    child: Icon(Icons.send_outlined))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "This month",
                          style: TextStyle(
                              color: black.withOpacity(0.5),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    NotificationWidget(),
                    NotificationWidget(),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          "Previous",
                          style: TextStyle(
                              color: black.withOpacity(0.5),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    NotificationWidget(),
                    NotificationWidget(),
                    NotificationWidget(),
                    NotificationWidget(),
                    NotificationWidget(),
                    NotificationWidget(),
                    NotificationWidget(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
