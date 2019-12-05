import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("设置"),
        ),
        body: ListView(
          children: <Widget>[
            _header(),
            _score(),
            _complaintAdvice(),
            invite(),
            _settings(),
            _signOut()
          ],
        ));
  }

  Widget _header() {
    return Container(
        padding: EdgeInsets.all(5),
        color: Colors.orangeAccent,
        child: Column(
          children: <Widget>[
            Container(
              width: 200,
              margin: EdgeInsets.only(top: 20),
              child: ClipOval(
                child: Image.network(
                    "http://b-ssl.duitang.com/uploads/item/201903/12/20190312172823_sioam.jpg"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "大反派",
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ));
  }

  // 积分
  Widget _score() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.black12, width: 1)
        )
      ),
      child: ListTile(
        leading: Icon(Icons.score),
        title: Text("我的积分"),
      ),
    );
  }

  // 邀请
  Widget invite() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.black12, width: 1)
        )
      ),
      child: ListTile(
        leading: Icon(Icons.email),
        title: Text("邀请好友"),
      ),
    );
  }

 // 投诉建议
  Widget _complaintAdvice() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.black12, width: 1)
        )
      ),
      child: ListTile(
        leading: Icon(Icons.chat),
        title: Text("投诉建议"),
      ),
    );
  }

  // 设置
  Widget _settings() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width:1, color: Colors.black12)
        )
      ),
      child: ListTile(
        leading: Icon(Icons.settings),
        title: Text("设置"),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  // 退出登录
  Widget _signOut() {
    return Container(
      child: Center(
        child: FlatButton(
          onPressed: () {},
          color: Colors.redAccent,
          child: Text("退出登录"),
        )
      ),
    );
  }

}
