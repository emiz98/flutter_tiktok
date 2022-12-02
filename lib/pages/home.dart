import 'package:flutter/material.dart';
import 'package:flutter_tiktok/constant/data_json.dart';
import 'package:flutter_tiktok/theme/colors.dart';
import 'package:flutter_tiktok/widgets/PanelLeft.dart';
import 'package:flutter_tiktok/widgets/SidePanel.dart';
import 'package:flutter_tiktok/widgets/TikTokPlayer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  // late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: items.length, vsync: this);
    // _videoPlayerController = VideoPlayerController.network(
    //     'https://v16-webapp.tiktok.com/063495731696064abb90163893d41146/621820e0/video/tos/useast2a/tos-useast2a-pve-0037c001-aiso/8bbb2b644eeb460a9707d6e021581a6f/?a=1988&br=2328&bt=1164&cd=0%7C0%7C1%7C0&ch=0&cr=0&cs=0&cv=1&dr=0&ds=3&er=&ft=XOQ9-3zqnz7Thp-tUDXq&l=20220224182026010245243100055472E5&lr=tiktok_m&mime_type=video_mp4&net=0&pl=0&qs=0&rc=M2xpZjM6Zm94OzMzZjczM0ApNDc2aDk3ZTxkN2g0NTRoOmdtcmhycjRnYjBgLS1kMWNzc2AtYTExMC5iLTMxNjVjNV46Yw%3D%3D&vl=&vr=')
    //   ..setLooping(true)
    //   ..initialize().then((value) {
    //     _videoPlayerController.play();
    //   });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController?.dispose();
    // _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
        controller: _tabController,
        children: List.generate(items.length, (index) {
          return Container(
              color: black,
              child: RotatedBox(
                quarterTurns: -1,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      child: TikTokPlayer(
                        videoUrl: items[index]['videoUrl'],
                      ),
                    ),
                    // SizedBox.expand(
                    //     child: FittedBox(
                    //         fit: BoxFit.cover,
                    //         child: SizedBox(
                    //             width: _videoPlayerController
                    //                         .value.size.width >
                    //                     0
                    //                 ? _videoPlayerController.value.size.width
                    //                 : 400,
                    //             height: _videoPlayerController
                    //                         .value.size.height >
                    //                     0
                    //                 ? _videoPlayerController.value.size.height
                    //                 : 300,
                    //             child: VideoPlayer(_videoPlayerController)))),
                    Container(
                      width: size.width,
                      height: size.height,
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 15, left: 15, bottom: 15),
                          child: Column(
                            children: [
                              const HomePageHeader(),
                              Flexible(
                                child: Row(
                                  children: [
                                    PanelLeft(
                                        accountName: items[index]['name'],
                                        caption: items[index]['caption'],
                                        songName: items[index]['songName']),
                                    SizedBox(
                                      width: size.width * 0.1,
                                    ),
                                    SidePanel(
                                      profileImg: items[index]['profileImg'],
                                      likesCount: items[index]['likes'],
                                      commentCount: items[index]['comments'],
                                      forwardCount: items[index]['shares'],
                                      albumImg: items[index]['albumImg'],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        }),
      ),
    );
  }
}

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Text(
              "Following   ",
              style: TextStyle(
                color: white.withOpacity(0.5),
                fontSize: 16,
              ),
            ),
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: primary,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          "┃",
          style: TextStyle(
            color: white.withOpacity(0.5),
            fontSize: 8,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "For You",
          style: TextStyle(
              color: white, fontSize: 19, fontWeight: FontWeight.w900),
        )
      ],
    );
  }
}
