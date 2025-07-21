# okrm_app_v1

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 文档

英文文档 https://docs.flutter.dev/get-started/install

中文文档 https://docs.flutter.cn/

flutter中文社区 https://book.flutterchina.club/

flutter 开源项目 https://github.com/flutterchina

## 环境配置

## 安装教程

1. VS Code
2. VS Code插件Dart-Code.flutter
3. [国内网络配置
](https://docs.flutter.cn/community/china)

## 使用说明

  - 2019/12/05 增加高德地图支持 https://pub-web.flutter-io.cn/packages/amap_map_fluttify
  - 安卓模拟器使用的是x86架构，导致安卓只能用真机调试。
  - IOS模拟器无法获取真实地址，所以模拟器无法使用获取当前位置
  - TODO

## 项目配置

- android\build.gradle.kts

```
// 增加两行配置
allprojects {
    repositories {
        // 1 阿里云仓库
        maven { url = uri("https://maven.aliyun.com/repository/gradle-plugin") }
        maven { url = uri("https://maven.aliyun.com/repository/public") }
        google()
        mavenCentral()
        // 2 gradle插件，要放到最后一行
        gradlePluginPortal()
    }
}
```
- android\gradle\wrapper\gradle-wrapper.properties

```
# 修改gradle下载地址，注意版本号要和之前一致
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists
# distributionUrl=https\://services.gradle.org/distributions/gradle-8.12-all.zip
distributionUrl=https\://mirrors.cloud.tencent.com/gradle/gradle-8.12-all.zip

```
