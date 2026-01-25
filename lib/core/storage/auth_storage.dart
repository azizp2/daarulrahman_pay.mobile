import 'package:get_storage/get_storage.dart';

class AuthStorage {
  static final _box = GetStorage();

  static const _tokenKey = 'auth_token';
  static const _userKey = 'auth_user';

  // 🔐 TOKEN
  static Future<void> saveToken(String token) async {
    await _box.write(_tokenKey, token);
  }

  static String? get token => _box.read<String>(_tokenKey);

  // 👤 USER
  static Future<void> saveUser(Map<String, dynamic> user) async {
    await _box.write(_userKey, user);
  }

  static Map<String, dynamic>? get user =>
      _box.read<Map<String, dynamic>>(_userKey);

  static String? get username => user?['id'];
  static String? get email => user?['email'];
  static String? get role => user?['role'];

  // 🧹 CLEAR
  static Future<void> clear() async {
    await _box.remove(_tokenKey);
    await _box.remove(_userKey);
  }

  static bool get isLoggedIn => token != null;
}
