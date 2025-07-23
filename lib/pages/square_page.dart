import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:okrm_app/widgets/map_view.dart';
import 'package:okrm_app/widgets/map_view_controller.dart';

class SquarePage extends StatefulWidget {
  const SquarePage({super.key});

  @override
  State<SquarePage> createState() => _SquarePageState();
}

class _SquarePageState extends State<SquarePage>
    with AutomaticKeepAliveClientMixin {
  final mapViewController = MapViewController();
  // 你也可以在构造函数或 initState 里做额外初始化
  @override
  Widget build(BuildContext context) {
    super.build(context); // 注意：AutomaticKeepAliveClientMixin 需要这一句

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('广场')),
      child: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onPanDown: (_) {},
                child: MapView(
                  mapType: MapType.amap,
                  controller: mapViewController,
                  onMapDrag: (pos) {
                    debugPrint(pos.toString());
                  },
                ),
              ),
            ),
            Positioned(
              left: 8,
              bottom: 8,
              child: CupertinoButton.filled(
                child: const Text('缺省'),
                onPressed: () {
                  // mapViewController.setZoom(6);
                  mapViewController.moveToCenter(const LatLng(50, 116.3976)); // 示例：按钮点击回到默认中心
                  // 添加一个 marker（例如在初始化时或点击事件中）
                  
                },
              ),
            ),
            Positioned(
              right: 8,
              bottom: 8,
              child: CupertinoButton.filled(
                child: const Text('添加Marker'),
                onPressed: () {
                  // 添加一个 marker（例如在初始化时或点击事件中）
                  mapViewController.addMarker(
                    Marker(
                      width: 40,
                      height: 40,
                      point: LatLng(39.9087, 116.3976),
                      child: const Icon(
                        CupertinoIcons.location_solid,
                        color: CupertinoColors.systemRed,
                        size: 32,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true; // 保证 tab 切换时不销毁
}
