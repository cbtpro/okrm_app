import 'package:flutter/cupertino.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: const CupertinoNavigationBar(
      //   middle: Text('我的'),
      // ),
      child: Center(
        child: CupertinoButton.filled(
          onPressed: () {
            // 你的点击逻辑
          },
          child: const Text('按钮'),
        ),
      ),
    );
  }
}
