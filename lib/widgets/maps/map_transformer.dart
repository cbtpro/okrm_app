import 'dart:math' as math;
import 'package:latlng/latlng.dart';

class MyMapTransformer {
  final double zoom;

  MyMapTransformer(this.zoom);

  static const tileSize = 256.0;

  // 经纬度转平面像素坐标
  Point latLngToPoint(LatLng latLng) {
    final scale = tileSize * math.pow(2, zoom);

    // 计算x坐标（经度映射到[0, scale]）
    final x = (latLng.longitude.degrees + 180) / 360 * scale;

    // 计算y坐标，纬度先转成弧度，再用墨卡托投影公式映射
    final latRad = latLng.latitude.degrees * math.pi / 180;
    final y = (1 - (math.log(math.tan(latRad) + 1 / math.cos(latRad)) / math.pi)) / 2 * scale;

    return Point(LatLng(Angle.degree(x), Angle.degree(y)));
  }

  // 平面像素坐标转经纬度
  LatLng pointToLatLng(math.Point<double> point) {
    final scale = tileSize * math.pow(2, zoom);

    final lng = (point.x / scale) * 360 - 180;

    final n = math.pi - 2 * math.pi * (point.y / scale);
    final lat = 180 / math.pi * math.atan(0.5 * (math.exp(n) - math.exp(-n)));

    return LatLng(Angle.degree(lat), Angle.degree(lng));
  }
}
