import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';

class SquarePage extends StatefulWidget {
  SquarePage({Key key}) : super(key: key);

  @override
  _SquarePageState createState() => _SquarePageState();
}

class _SquarePageState extends State<SquarePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("广场"),
      ),
      body: Padding(
          padding: EdgeInsets.all(0),
          child: new FlutterMap(
            options:
                new MapOptions(center: new LatLng(39.914271, 116.403406), zoom: 13),
            layers: [
              new TileLayerOptions(
                urlTemplate: "https://api.tiles.mapbox.com/v4/"
                    "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                additionalOptions: {
                  'accessToken': 'pk.eyJ1IjoiY2J0cHJvIiwiYSI6ImNrM2sybjBnYjBuajEzY2xjZDNxaG5yZTUifQ.yTN30sJQhEbSePbYufGSwQ',
                  'id': 'mapbox.streets',
                },
              ),
              new MarkerLayerOptions(
                markers: [
                  new Marker(
                    width: 10.0,
                    height: 10.0,
                    point: new LatLng(39.914271, 116.403406),
                    builder: (ctx) => new Container(
                      child: new FlutterLogo(),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
