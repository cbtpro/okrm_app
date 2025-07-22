import 'dart:math';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart' as latlng;
import 'package:latlong2/latlong.dart'; // 统一输出 LatLng 类型
import 'package:map/map.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'base_map_view.dart';

class TencentMapView extends BaseMapView {
  const TencentMapView({super.key, super.onDrag});

  @override
  Widget build(BuildContext context) {
    final controller = MapController(
      location: latlng.LatLng.degree(30.0, 120.0),
      zoom: 10,
    );

    void handleDrag() {
      if (onDrag != null) {
        final latlngCenter = controller.center;
        onDrag!(
          LatLng(latlngCenter.latitude.degrees, latlngCenter.longitude.degrees),
        );
      }
    }

    return GestureDetector(
      onPanUpdate: (_) => handleDrag(),
      child: MapLayout(
        controller: controller,
        builder: (context, transformer) {
          return TileLayer(
            builder: (context, x, y, z) {
              final tilesInZoom = pow(2.0, z).floor();
              x = (x % tilesInZoom + tilesInZoom) % tilesInZoom;
              y = (y % tilesInZoom + tilesInZoom) % tilesInZoom;

              final url =
                  'https://rt${(x + y) % 4}.map.gtimg.com/tile'
                  '?z=$z&x=$x&y=$y&type=vector&styleid=2';

              return CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              );
            },
          );
        },
      ),
    );
  }
}
