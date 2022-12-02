import 'package:flutter/material.dart';
import 'package:flutter_tiktok/theme/colors.dart';
import 'package:lottie/lottie.dart';
import 'dart:math' as math;

class Album extends StatefulWidget {
  final String albumImg;
  const Album({Key? key, required this.albumImg}) : super(key: key);

  @override
  _AlbumState createState() => _AlbumState();
}

class _AlbumState extends State<Album> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RotationTransition(
          turns: const AlwaysStoppedAnimation(-40 / 360),
          child: Container(
              // color: primary,
              height: 120,
              child: Stack(
                children: [
                  ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          Color.fromARGB(255, 255, 255, 255),
                          BlendMode.modulate),
                      child: Lottie.asset('assets/lottie/notes.json',
                          fit: BoxFit.cover))
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: RotationTransition(
            turns: _animation,
            child: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black.withOpacity(0.6)),
              child: Center(
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(widget.albumImg),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// RotationTransition(
//           turns: const AlwaysStoppedAnimation(30 / 360),
//           child: Container(
//             color: primary,
//             height: 100,
//             child: FittedBox(
//               fit: BoxFit.fitHeight,
//               child: Lottie.asset('assets/videos/music.json'),
//             ),
//           ),
//         ),