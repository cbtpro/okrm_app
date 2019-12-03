import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:okrm_app/pages/index_page.dart';

void main() => runApp(OkrmApp());

class OkrmApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "生而不庸",
        initialRoute: "/",
        debugShowCheckedModeBanner: true,
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