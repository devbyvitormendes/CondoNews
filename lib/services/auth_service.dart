import 'dart:convert';

import 'package:condo_news/domain/models/auth/auth_response.dart';
import 'package:condo_news/domain/utils/secure_storage.dart';
import 'package:condo_news/services/base_service.dart';
import 'package:http/http.dart' as http;
import 'package:condo_news/domain/env/environment.dart';

class AuthService extends BaseService {

  Future<void> authenticate(String username, String password) async {
    final response = await http.post(
      Uri.parse('${Environment.baseUrl}/v1/auth/authenticate'),
      headers: headers,
      body: json.encode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      dynamic data = jsonDecode(utf8.decode(response.bodyBytes));
      AuthResponse authResponse = AuthResponse.fromJson(data);

      await SecureStorage.write('token', authResponse.token);
      await SecureStorage.write('refreshToken', authResponse.refreshToken);
    } else {
      throw Exception('${response.statusCode}: Falha na autenticação');
    }
  }
}
