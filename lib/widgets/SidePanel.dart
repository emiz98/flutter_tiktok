import 'package:flutter/cupertino.dart';
import 'package:flutter_tiktok/widgets/Album.dart';
import 'package:flutter_tiktok/widgets/Profile.dart';
import 'package:flutter_tiktok/widgets/SidePanel_icon.dart';
import 'package:flutter_tiktok/widgets/tik_tok_icons.dart';

class SidePanel extends StatefulWidget {
  final String profileImg;
  final String likesCount;
  final String commentCount;
  final String forwardCount;
  final String albumImg;

  const SidePanel(
      {Key? key,
      required this.profileImg,
      required this.likesCount,
      required this.commentCount,
      required this.forwardCount,
      required this.albumImg})
      : super(key: key);

  @override
  _SidePanelState createState() => _SidePanelState();
}

class _SidePanelState extends State<SidePanel> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        height: size.height,
        // decoration: BoxDecoration(color: secondary),
        child: Column(
          children: [
            Container(
              height: size.height * 0.25,
              // color: primary,
            ),
            Expanded(
                child: Container(
              // decoration: BoxDecoration(color: primary),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Profile(profileImg: widget.profileImg),
                  SidePanel_icon(
                      icon: TikTokIcons.heart,
                      size: 35.0,
                      isHeart: true,
                      count: widget.likesCount),
                  SidePanel_icon(
                      icon: TikTokIcons.chat_bubble,
                      size: 35.0,
                      isHeart: false,
                      count: widget.commentCount),
                  SidePanel_icon(
                      icon: TikTokIcons.reply,
                      size: 30.0,
                      isHeart: false,
                      count: widget.forwardCount),
                  Album(albumImg: widget.albumImg)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
