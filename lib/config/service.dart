enum Environment {
  development,
  testing,
  production,
}

class ServiceConfig {
  // 开发环境地址
  static const String devUrl = 'http://127.0.0.1:8080/';
  // 测试环境地址
  static const String testUrl = 'http://test.example.com/';
  // 生产环境地址
  static const String prodUrl = 'https://api.yourdomain.com/';

  // 当前环境，默认开发环境
  static Environment currentEnvironment = Environment.development;

  // 根据当前环境返回对应的服务地址
  static String get serviceUrl {
    switch (currentEnvironment) {
      case Environment.production:
        return prodUrl;
      case Environment.testing:
        return testUrl;
      case Environment.development:
        return devUrl;
      }
  }
}