import 'package:flutter/material.dart';
import 'package:flutter_tiktok/theme/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class TikTokPlayer extends StatefulWidget {
  final String videoUrl;
  const TikTokPlayer({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _TikTokPlayerState createState() => _TikTokPlayerState();
}

class _TikTokPlayerState extends State<TikTokPlayer> {
  bool loading = true;
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl)
      ..setLooping(true)
      ..initialize();
    _videoPlayerController.pause();
    delay();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController.dispose();
  }

  delay() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        loading = false;
        _videoPlayerController.play();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(child: LayoutBuilder(builder: (context, constraints) {
      if (!loading) {
        return InkWell(
          onTap: () {
            setState(() {
              _videoPlayerController.value.isPlaying
                  ? _videoPlayerController.pause()
                  : _videoPlayerController.play();
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: size.height,
                color: black,
              ),
              VisibilityDetector(
                  key: Key("abcd"),
                  onVisibilityChanged: (VisibilityInfo info) {
                    if (info.visibleFraction == 0) {
                      _videoPlayerController.pause();
                    }
                  },
                  child: AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController),
                  )),
              _videoPlayerController.value.isPlaying
                  ? Container()
                  : Icon(
                      Icons.play_arrow,
                      size: 50,
                      color: white.withOpacity(0.7),
                    )
            ],
          ),
        );
      } else {
        return Container(
            height: size.width * 0.3,
            child: Lottie.asset('assets/lottie/loader.json'));
      }
    }));
  }
}
