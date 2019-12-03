import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'square_page.dart';
import 'profile_page.dart';
import 'settings_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text("广场")
    ),BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.info),
      title: Text("事件")
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person),
      title: Text("我的")
    )
  ];

  final List pages = [
    SquarePage(),
    ProfilePage(),
    SettingsPage()
  ];

  int currentPageIndex = 0;
  var currentPage;
  @override
  void initState() {
    currentPage = pages[currentPageIndex];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPageIndex,
        items: bottomNavigationBarItems,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
            currentPage = pages[currentPageIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}