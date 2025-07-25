import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// 地图基础视图，供不同地图实现（高德、百度、谷歌、腾讯等）继承使用。
abstract class BaseMapView extends StatelessWidget {
  /// 地图中心点变化时的回调（如拖动）
  final void Function(LatLng center)? onDrag;

  final MapController? mapController;

  final List<Marker> markers;

  final List<Polygon<Object>> polygons;

  final List<Polyline> polylines;

  final List<CircleMarker> circles;

  const BaseMapView({
    super.key,
    this.onDrag,
    this.mapController,
    this.markers = const [],
    this.polygons = const [],
    this.polylines = const [],
    this.circles = const [],
  });
}
