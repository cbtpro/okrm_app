import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart'; // 推荐用latlong2
import 'package:okrm_app/widgets/map_view_controller.dart';
import 'package:okrm_app/widgets/maps/tencent-map-view.dart';
import './maps/base_map_view.dart';
import './maps/amap_map_view.dart';
import './maps/google_map_view.dart';

enum MapType { google, amap, tencent }

class MapView extends StatefulWidget {
  final MapType mapType;

  /// 地图控制器（必须）
  final MapViewController controller;

  /// 地图拖动时回调当前中心点经纬度
  final void Function(LatLng center)? onMapDrag;

  const MapView({
    super.key,
    this.mapType = MapType.amap,
    required this.controller,
    this.onMapDrag,
  });

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  void initState() {
    super.initState();
    widget.controller.bindListener(_onControllerChanged);
  }

  @override
  void dispose() {
    widget.controller.unbindListener();
    super.dispose();
  }

  void _onControllerChanged() {
    if (mounted) {
      setState(() {
        debugPrint('状态发生变化');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    BaseMapView mapView;

    switch (widget.mapType) {
      case MapType.amap:
        mapView = AmapMapView(
          onDrag: widget.onMapDrag,
          mapController: widget.controller.mapController,
          markers: widget.controller.markers,
          polygons: widget.controller.polygons,
          polylines: widget.controller.polylines,
          circles: widget.controller.circles,
        );
        break;
      case MapType.tencent:
        mapView = TencentMapView(
          onDrag: widget.onMapDrag,
          mapController: widget.controller.mapController,
          markers: widget.controller.markers,
          polygons: widget.controller.polygons,
          polylines: widget.controller.polylines,
          circles: widget.controller.circles,
        );
        break;
      case MapType.google:
        mapView = GoogleMapView(
          onDrag: widget.onMapDrag,
          mapController: widget.controller.mapController,
          markers: widget.controller.markers,
          polygons: widget.controller.polygons,
          polylines: widget.controller.polylines,
          circles: widget.controller.circles,
        );
        break;
    }
    return mapView;
  }
}
