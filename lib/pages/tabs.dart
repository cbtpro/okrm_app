import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './square_page.dart';
import './events_page.dart';
import './profile_page.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  // 记录当前选中了哪个tab页面
  int _currentIndex = 0;

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    this._pageController = PageController(initialPage: this._currentIndex);
  }

  List<Widget> _pages = [
    SquarePage(),
    EventPage(),
    ProfilePage()
  ];

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: this._pageController,
        children: this._pages,
        onPageChanged: (context) {
          print(context);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.orange,
        type: BottomNavigationBarType.fixed,
        currentIndex: this._currentIndex,
        onTap: (index) {
          setState(() {
            this._currentIndex = index;
            this._pageController.jumpToPage(this._currentIndex);
          });
        },
        items: bottomNavigationBarItems,
      ),
    );
  }
}