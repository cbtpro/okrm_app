import 'package:flutter/material.dart';
import './maps/base_map_view.dart';
import './maps/google_map_view.dart';
import './maps/amap_map_view.dart';
import './maps/baidu_map_view.dart';

enum MapType {
  google,
  amap,
  baidu,
}

class MapView extends StatelessWidget {
  final MapType mapType;

  const MapView({super.key, this.mapType = MapType.amap});

  @override
  Widget build(BuildContext context) {
    BaseMapView mapView;

    switch (mapType) {
      case MapType.google:
        mapView = const GoogleMapView();
        break;
      case MapType.amap:
        mapView = const AmapMapView();
        break;
      // case MapType.baidu:
      //   mapView = const BaiduMapView();
        // break;
      default:
        mapView = const GoogleMapView();
    }

    return mapView;
  }
}
