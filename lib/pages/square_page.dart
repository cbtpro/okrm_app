import 'package:flutter/cupertino.dart';
import 'package:okrm_app/widgets/map_view.dart';

class SquarePage extends StatelessWidget {
  const SquarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: CupertinoNavigationBar(
      //   middle: const Text('广场'),
      // ),
      child: SafeArea(
        child: Stack(
          children: [
            // 地图铺满整个 SafeArea 区域
            Positioned.fill(
              child: MapView(
                // 可切换为 MapType.amap / baidu 等
                mapType: MapType.amap,
                onMapDrag: (a) => {
                  print(a)
                },
              ),
            ),
            // 按钮悬浮在左下角，带 padding
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
}