import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final FlutterSecureStorage _secureStorage;

  LocalStorage({required FlutterSecureStorage secureStorage})
      : _secureStorage = secureStorage;

  Future<String?> getToken() async {
    final String? token = await _secureStorage.read(key: 'jwt');

    return token;
  }

  Future<void> removeToken() async {
    await _secureStorage.delete(key: 'jwt');
  }

  Future<void> storeToken(String value) async {
    await _secureStorage.write(key: 'jwt', value: value);
  }
}
