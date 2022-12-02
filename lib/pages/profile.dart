import 'package:flutter/material.dart';
import 'package:flutter_tiktok/constant/data_json.dart';
import 'package:flutter_tiktok/theme/colors.dart';
import 'package:flutter_tiktok/widgets/tik_tok_icons.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.manage_accounts_outlined),
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "emiz_xxx",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.perm_contact_calendar_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.menu_outlined),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 30,
            color: black.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_outline,
                  color: black.withOpacity(0.6),
                  size: 16,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Private account",
                  style: TextStyle(
                      fontSize: 15,
                      color: black.withOpacity(0.6),
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/hannah.jpg'))),
              ),
              SizedBox(
                height: 5,
              ),
              Text("@emiz_xxx",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("122",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                  Text("Following",
                      style: TextStyle(
                          fontSize: 12, color: black.withOpacity(0.5)))
                ],
              ),
              Column(
                children: [
                  Text("15",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                  Text("Followers",
                      style: TextStyle(
                          fontSize: 12, color: black.withOpacity(0.5))),
                ],
              ),
              Column(
                children: [
                  Text("0",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                  Text("    Like   ",
                      style: TextStyle(
                          fontSize: 12, color: black.withOpacity(0.5)))
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(100, 40),
                  side: BorderSide(width: 1, color: black.withOpacity(0.3)),
                  textStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  primary: black.withOpacity(0.7),
                ),
                child: Text(
                  "      Edit profile      ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () => {},
              ),
              SizedBox(
                width: 5,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(30, 40),
                  side: BorderSide(width: 1, color: black.withOpacity(0.3)),
                  textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  primary: black.withOpacity(0.7),
                ),
                child: Icon(Icons.bookmark_outline),
                onPressed: () => {},
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: black.withOpacity(0.1))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.drafts_outlined),
                Icon(
                  TikTokIcons.heart,
                  size: 18,
                ),
                Icon(Icons.lock_outline),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: MediaQuery.of(context).size.width * 0.3 / 150,
              children: List.generate(gifs.length, (index) {
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(gifs[index]['url']))),
                );
              }),
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
