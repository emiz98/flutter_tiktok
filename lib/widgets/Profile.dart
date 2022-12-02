import 'package:flutter/material.dart';
import 'package:flutter_tiktok/theme/colors.dart';

class Profile extends StatefulWidget {
  final String profileImg;
  const Profile({Key? key, required this.profileImg}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      child: Stack(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                border: Border.all(color: white),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(widget.profileImg), fit: BoxFit.cover)),
          ),
          Positioned(
              left: 16,
              bottom: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: primary),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: white,
                    size: 15,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
