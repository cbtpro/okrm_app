import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// 通用路由跳转方法
/// [context] 上下文
/// [page] 目标页面Widget
/// [useCupertino] 是否强制使用Cupertino风格路由动画，默认按平台判断
/// // 强制用Material动画
// navigateTo(context, SecondPage(), useCupertino: false);

// 强制用Cupertino动画
// navigateTo(context, SecondPage(), useCupertino: true);
Future<T?> navigateTo<T>(
  BuildContext context,
  Widget page, {
  bool? useCupertino,
}) {
  final bool isCupertino = useCupertino ??
      Theme.of(context).platform == TargetPlatform.iOS; // 默认iOS用Cupertino

  if (isCupertino) {
    return Navigator.of(context).push<T>(
      CupertinoPageRoute(builder: (_) => page),
    );
  } else {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(builder: (_) => page),
    );
  }
}
