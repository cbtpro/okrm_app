import 'package:flutter/cupertino.dart';
import 'square_page.dart';
import 'events_page.dart';
import 'profile_page.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  late CupertinoTabController _tabController;

  @override
  void initState() {
    super.initState();
    // 这里必须初始化
    _tabController = CupertinoTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: _tabController,
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: '广场'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.info), label: '事件'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: '我的'),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return SquarePage();
          case 1:
            return EventsPage();
          case 2:
            return ProfilePage();
          default:
            return Container();
        }
      },
    );
  }
}