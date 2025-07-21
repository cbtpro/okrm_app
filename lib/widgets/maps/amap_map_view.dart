import 'dart:math';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'base_map_view.dart';

class AmapMapView extends BaseMapView {
  const AmapMapView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MapController(
      location: LatLng.degree(30.0, 120.0), // 杭州
      zoom: 10,
    );

    return MapLayout(
      controller: controller,
      builder: (context, transformer) {
        return TileLayer(
          builder: (context, x, y, z) {
            final tilesInZoom = pow(2.0, z).floor();
            x = (x % tilesInZoom + tilesInZoom) % tilesInZoom;
            y = (y % tilesInZoom + tilesInZoom) % tilesInZoom;

            // 1 到 4 之间的随机数，用于高德服务器负载均衡
            final serverNum = 1 + (x + y) % 4;

            final url =
                'https://wprd0$serverNum.is.autonavi.com/appmaptile'
                '?x=$x&y=$y&z=$z'
                '&lang=zh_cn&size=1&scl=1&style=7&key=你的密钥';

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
    );
  }
}
