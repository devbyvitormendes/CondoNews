import 'dart:convert';

import 'package:condo_news/domain/env/environment.dart';
import 'package:condo_news/domain/models/exception_model.dart';
import 'package:condo_news/domain/models/news_model.dart';
import 'package:condo_news/domain/models/response_page_model.dart';
import 'package:condo_news/services/base_service.dart';
import 'package:condo_news/services/exception/condo_exception.dart';
import 'package:http/http.dart' as http;

class NewsService extends BaseService {
  Future<ResponsePageModel> getBreakingNews() async {
    await setAuthHeader();
    final response = await http.get(
        Uri.parse('${Environment.baseUrl}/v1/news/breaking'),
        headers: headers);

    if (response.statusCode == 200) {
      dynamic data = jsonDecode(utf8.decode(response.bodyBytes));
      return ResponsePageModel.fromJson(data);
    } else {
      parseError(response);
      throw Exception('Falha ao buscar destaques.');
    }
  }

  Future<ResponsePageModel> getNews(int page, int size) async {
    await setAuthHeader();
    final response = await http.get(Uri.parse('${Environment.baseUrl}/v1/news?page=$page&size=$size'),
        headers: headers);

    if (response.statusCode == 200) {
      dynamic data = jsonDecode(utf8.decode(response.bodyBytes));
      return ResponsePageModel.fromJson(data);
    } else {
      parseError(response);
      throw Exception('Falha ao buscar notícias.');
    }
  }

  Future<NewsModel> getNewsById(int id) async {
    await setAuthHeader();
    final response = await http.get(
        Uri.parse('${Environment.baseUrl}/v1/news/$id/'),
        headers: headers);

    if (response.statusCode == 200) {
      dynamic data = jsonDecode(utf8.decode(response.bodyBytes));

      return NewsModel.fromMap(data);
    } else {
      parseError(response);
      throw Exception('Falha ao buscar notícias');
    }
  }
  
  void parseError(http.Response response) {
    switch (response.statusCode) {
      case 403:
        throw const CondoException('Acesso não permitido.');
      default: {
        ExceptionModel exception = ExceptionModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        throw CondoException(exception.message);
      }
    }
  }
}
