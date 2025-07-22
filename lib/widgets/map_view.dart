import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart'; // 推荐用latlong2
import 'package:okrm_app/widgets/maps/tencent-map-view.dart';
import './maps/base_map_view.dart';
import './maps/amap_map_view.dart';
import './maps/google_map_view.dart';

enum MapType {
  google,
  amap,
  tencent,
}

class MapView extends StatefulWidget {
  final MapType mapType;

  /// 地图拖动时回调当前中心点经纬度
  final void Function(LatLng center)? onMapDrag;

  const MapView({super.key, this.mapType = MapType.amap, this.onMapDrag});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    BaseMapView mapView;

    switch (widget.mapType) {
      case MapType.amap:
        mapView = AmapMapView(onDrag: widget.onMapDrag);
        break;
      case MapType.tencent:
        mapView = TencentMapView(onDrag: widget.onMapDrag);
        break;
      case MapType.google:
        mapView = GoogleMapView(onDrag: widget.onMapDrag);
        break;
    }

    return mapView;
  }
}
