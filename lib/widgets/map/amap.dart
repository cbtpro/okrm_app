// import 'package:flutter/material.dart';
// import 'package:amap_map_fluttify/amap_map_fluttify.dart';

// class AmapWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AmapView(
//       // 地图类型
//       mapType: MapType.Standard,
//       // 是否显示缩放控件
//       showZoomControl: true,
//       // 是否显示指南针控件
//       showCompass: true,
//       // 是否显示比例尺控件
//       showScaleControl: true,
//       // 是否使能缩放手势
//       zoomGesturesEnabled: true,
//       // 是否使能滚动手势
//       scrollGesturesEnabled: true,
//       // 是否使能旋转手势
//       rotateGestureEnabled: true,
//       // 是否使能倾斜手势
//       tiltGestureEnabled: true,
//       // 缩放级别
//       zoomLevel: 10,
//       // 中心点坐标
//       centerCoordinate: LatLng(39, 116),
//       // 标记
//       markers: <MarkerOption>[],
//       // 标识点击回调
//       onMarkerClicked: (Marker marker) {
//         return null;
//       },
//       // 地图点击回调
//       onMapClicked: (LatLng coord) {
//         return null;
//       },
//       // 地图拖动回调
//       onMapMoveStart: (MapDrag drag) {
//         return null;
//       },
//       onMapMoveEnd: (MapDrag drag) {
//         return null;
//       },
//       // 地图创建完成回调
//       onMapCreated: (controller) async {
//         // requestPermission是权限请求方法, 需要你自己实现
//         // 如果不知道怎么处理, 可以参考example工程的实现, example过程依赖了`permission_handler`插件.
//         if (await requestPermission()) {
//           await controller.showMyLocation(true);
//         }
//       },
//     );
//   }
// }
