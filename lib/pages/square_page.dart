import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:okrm_app/widgets/map_view.dart';

class SquarePage extends StatefulWidget {
  const SquarePage({super.key});

  @override
  State<SquarePage> createState() => _SquarePageState();
}

class _SquarePageState extends State<SquarePage> with AutomaticKeepAliveClientMixin {
  final MapController _mapController = MapController();

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
                  mapController: _mapController,
                  mapType: MapType.amap,
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
                child: const Text('按钮'),
                onPressed: () {},
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
