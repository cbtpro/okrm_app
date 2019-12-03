import 'package:flutter/material.dart';
import '../widgets/map/mapbox.dart';

class SquarePage extends StatefulWidget {
  SquarePage({Key key}) : super(key: key);

  @override
  _SquarePageState createState() => _SquarePageState();
}

class _SquarePageState extends State<SquarePage> with AutomaticKeepAliveClientMixin  {
  
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("广场"),
      ),
      body: Padding(padding: EdgeInsets.all(0), child: MapBox()),
    );
  }
}
