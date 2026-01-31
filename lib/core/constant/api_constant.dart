class ApiConstant {
  static const String baseUrl = 'http://10.79.128.108:7000/api';
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
}

class EndpointConstant {
  // auth
  static const String login = '/auth/login';

  // merchant
  static const String merchant = '/merchant';
  static const String member = '/member';
}
