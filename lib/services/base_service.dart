import 'package:condo_news/domain/utils/secure_storage.dart';

class BaseService {
  Map<String, String> headers = {
    'Access-Control-Allow-Origin': '*',
    'Accept': '*/*',
    'Content-Type': 'application/json',
    'Connection': 'keep-alive',
  };

  Future<void> setAuthHeader() async {
     Map<String, String> authorization = {
      'Authorization': 'Bearer ${await SecureStorage.read('token')}'
    };

    headers.addAll(authorization);
  }
}