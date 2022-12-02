import 'package:flutter/material.dart';
import 'package:flutter_tiktok/theme/colors.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: black, body: getBody());
  }

  Widget getBody() {
    return Container();
  }
}
