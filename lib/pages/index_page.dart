import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'tabs.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  @override
  Widget build(BuildContext context) {
    return Tabs();
  }
}