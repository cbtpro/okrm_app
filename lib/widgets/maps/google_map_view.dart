import 'dart:math';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'base_map_view.dart';

class GoogleMapView extends BaseMapView {
  const GoogleMapView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MapController(
      // location: const LatLng(Angle.degree(0), Angle.degree(0)),
      location: LatLng.degree(30.0, 120.0), // 设置一个有效坐标
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

            final url =
                'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488';

            return CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
            );
          },
        );
      },
    );
  }
}
