import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'base_map_view.dart';

class GoogleMapView extends BaseMapView {
  const GoogleMapView({super.key, super.onDrag, super.mapController });

  @override
  Widget build(BuildContext context) {
    final LatLng beijingCenter = const LatLng(39.9087, 116.3976);
    final controller = mapController ?? MapController();
    final tileProvider = FMTCTileProvider(
      stores: const {'mapStore': BrowseStoreStrategy.readUpdateCreate},
      loadingStrategy: BrowseLoadingStrategy.onlineFirst,
      errorHandler: (e) {
        debugPrint("Error: $e");
        return Uint8List(256);
      },
    );

    return FlutterMap(
      mapController: controller,
      options: MapOptions(
        initialCenter: beijingCenter,
        initialZoom: 5,
        maxZoom: 18,
        minZoom: 3,
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.all,
        ),
        onPositionChanged: (position, hasGesture) {
          if (hasGesture && onDrag != null) {
            onDrag!(position.center);
          }
        },
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://wprd0{s}.is.autonavi.com/appmaptile?x={x}&y={y}&z={z}&lang=zh_cn&size=1&scl=1&style=7&key=${dotenv.env['AMAP_KEY']}',
          subdomains: const ['1', '2', '3', '4'],
          maxZoom: 18,
          minZoom: 3,
          tileProvider: tileProvider,
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: [
            Marker(
              width: 40.0,
              height: 40.0,
              point: beijingCenter,
              child: Icon(Icons.location_on, color: Colors.red, size: 40.0),
            ),
          ],
        ),
      ],
    );
  }
}
