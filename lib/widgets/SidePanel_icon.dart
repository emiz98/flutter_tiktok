import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tiktok/theme/colors.dart';
import 'package:lottie/lottie.dart';

class SidePanel_icon extends StatefulWidget {
  final IconData icon;
  final double size;
  final String count;
  final bool isHeart;
  const SidePanel_icon(
      {Key? key,
      required this.icon,
      required this.size,
      required this.count,
      required this.isHeart})
      : super(key: key);

  @override
  _SidePanel_iconState createState() => _SidePanel_iconState();
}

class _SidePanel_iconState extends State<SidePanel_icon> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            child: isFavorite
                ? SizedBox(
                    height: 50,
                    child: Lottie.asset('assets/lottie/heart.json',
                        repeat: false, fit: BoxFit.cover),
                  )
                : SizedBox(
                    height: 50,
                    child: Icon(
                      widget.icon,
                      color: white,
                      size: widget.size,
                    ))),
        Text(
          widget.count,
          style: TextStyle(color: white, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
