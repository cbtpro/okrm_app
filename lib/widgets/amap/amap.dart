
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:okrm_app/utils/utils.export.dart';


class AmapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return AmapView(
      // 地图类型
      mapType: MapType.Standard,
      // 是否显示缩放控件
      showZoomControl: true,
      // 是否显示指南针控件
      showCompass: false,
      // 是否显示比例尺控件
      showScaleControl: true,
      // 是否使能缩放手势
      zoomGesturesEnabled: true,
      // 是否使能滚动手势
      scrollGesturesEnabled: true,
      // 是否使能旋转手势
      rotateGestureEnabled: true,
      // 是否使能倾斜手势
      tiltGestureEnabled: true,
      // 缩放级别
      zoomLevel: 13,
      // 中心点坐标
      centerCoordinate: LatLng(22.529714, 113.943293),
      // 标记
      markers: <MarkerOption>[],
      // 标识点击回调
      onMarkerClick: (Marker marker) {
        return null;
      },
      // 地图点击回调
      onMapClick: (LatLng coord) {
        return null;
      },
      // 地图拖动回调
      onMapDrag: (MapDrag drag) {
        return null;
      },
      // 地图创建完成回调
      onMapCreated: (controller) async {
        if (await requestPermission()) {
          await controller.showMyLocation(true);
          await controller.setZoomLevel(13);
        }
      },
    );
  }
}
