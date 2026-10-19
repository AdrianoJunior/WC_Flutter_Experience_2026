import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wc_2026_mobile/core/exceptions/app_exception.dart';

class SecureStorageService({
  final FlutterSecureStorage _storage = const FlutterSecureStorage(),
}) {
  Future<String?> fetch(String key) async =>
      _guard(() => _storage.read(key: key));

  Future<void> save(String key, String value) async =>
      _guard(() => _storage.write(key: key, value: value));

  Future<void> delete(String key) async =>
      _guard(() => _storage.delete(key: key));

  Future<T> _guard<T>(Function() action) async {
    try {
      return await action();
    } catch (e, stackTrace) {
      throw StorageException(cause: e, stackTrace: stackTrace);
    }
  }
}
