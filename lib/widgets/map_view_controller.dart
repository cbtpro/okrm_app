import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapViewController {
  final MapController mapController = MapController();

  final LatLng defaultCenter = const LatLng(39.9087, 116.3976);
  LatLng currentCenter = const LatLng(39.9087, 116.3976);
  double currentZoom = 12.0;

  final List<Marker> _markers = [];
  final List<Polygon<Object>> _polygons = [];
  final List<Polyline> _polylines = [];
  final List<CircleMarker> _circles = [];

  void Function()? _notifyChange;

  void bindListener(void Function() listener) {
    _notifyChange = listener;
  }

  void unbindListener() {
    _notifyChange = null;
  }

  // ===== READONLY GETTERS =====
  List<Marker> get markers => List.unmodifiable(_markers);
  List<Polygon<Object>> get polygons => List.unmodifiable(_polygons);
  List<Polyline> get polylines => List.unmodifiable(_polylines);
  List<CircleMarker> get circles => List.unmodifiable(_circles);

  // ===== MARKERS =====
  void addMarker(Marker marker) {
    _markers.add(marker);
    _notifyChange?.call();
  }

  void removeMarker(Marker marker) {
    _markers.remove(marker);
    _notifyChange?.call();
  }

  void clearMarkers() {
    _markers.clear();
    _notifyChange?.call();
  }

  // ===== POLYGONS =====
  void addPolygon(Polygon<Object> polygon) {
    _polygons.add(polygon);
    _notifyChange?.call();
  }

  void removePolygon(Polygon<Object> polygon) {
    _polygons.remove(polygon);
    _notifyChange?.call();
  }

  void clearPolygons() {
    _polygons.clear();
    _notifyChange?.call();
  }

  // ===== POLYLINES =====
  void addPolyline(Polyline polyline) {
    _polylines.add(polyline);
    _notifyChange?.call();
  }

  void removePolyline(Polyline polyline) {
    _polylines.remove(polyline);
    _notifyChange?.call();
  }

  void clearPolylines() {
    _polylines.clear();
    _notifyChange?.call();
  }

  // ===== CIRCLES =====
  void addCircle(CircleMarker circle) {
    _circles.add(circle);
    _notifyChange?.call();
  }

  void removeCircle(CircleMarker circle) {
    _circles.remove(circle);
    _notifyChange?.call();
  }

  void clearCircles() {
    _circles.clear();
    _notifyChange?.call();
  }

  // ===== MAP MOVEMENT =====
  void moveToCenter([LatLng? center]) {
    currentCenter = center ?? defaultCenter;
    mapController.move(currentCenter, currentZoom);
  }

  void moveTo(LatLng point, {double? zoom}) {
    currentCenter = point;
    mapController.move(point, zoom ?? currentZoom);
  }

  void setZoom(double zoom) {
    currentZoom = zoom;
    mapController.move(currentCenter, zoom);
  }
}
