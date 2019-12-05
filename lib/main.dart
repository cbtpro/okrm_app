import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:okrm_app/pages/index_page.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';

Future<void> main() async {
  // ios端初始化高德地图key
  await AmapCore.init('5d570ce95aa24feab2cd9f000af2b6f6');

  runApp(OkrmApp());
}



class OkrmApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "生而不庸",
        initialRoute: "/",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.orange
        ),
        routes: {
          "/": (context) => IndexPage()
        },
      ),
    );
  }
}