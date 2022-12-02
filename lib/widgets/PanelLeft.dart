import 'package:flutter/material.dart';
import 'package:flutter_tiktok/theme/colors.dart';
import 'package:lottie/lottie.dart';

class PanelLeft extends StatefulWidget {
  final String accountName;
  final String caption;
  final String songName;

  const PanelLeft(
      {Key? key,
      required this.accountName,
      required this.caption,
      required this.songName})
      : super(key: key);

  @override
  _PanelLeftState createState() => _PanelLeftState();
}

class _PanelLeftState extends State<PanelLeft> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.7,
      height: size.height,
      // decoration: BoxDecoration(color: primary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "@" + widget.accountName,
            style: TextStyle(
                color: white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.caption,
            style: TextStyle(color: white.withOpacity(0.8)),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                  height: 40, child: Lottie.asset('assets/lottie/music2.json')
                  // Image.asset(
                  //   'assets/images/music-tune.ico',
                  //   color: white,
                  // ),
                  ),
              SizedBox(
                width: 5,
              ),
              Text(
                widget.songName,
                style: TextStyle(color: white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
