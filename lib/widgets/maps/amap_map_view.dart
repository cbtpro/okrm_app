import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'base_map_view.dart';

class AmapMapView extends BaseMapView {
  const AmapMapView({super.key, super.onDrag});

  @override
  Widget build(BuildContext context) {
    final mapController = MapController();
    final _tileProvider = FMTCTileProvider(
      stores: const {'mapStore': BrowseStoreStrategy.readUpdateCreate},
    );

    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: const LatLng(30.0, 120.0),
        initialZoom: 10,
        interactionOptions: const InteractionOptions(flags: InteractiveFlag.all),
        onPositionChanged: (position, hasGesture) {
          if (hasGesture && onDrag != null) {
            onDrag!(position.center);
          }
        },
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://wprd0{s}.is.autonavi.com/appmaptile?x={x}&y={y}&z={z}'
              '&lang=zh_cn&size=1&scl=1&style=7&key=${dotenv.env['AMAP_KEY']}',
          subdomains: const ['1', '2', '3', '4'],
          tileProvider: _tileProvider,
          userAgentPackageName: 'com.example.app',
        ),
      ],
    );
  }
}
