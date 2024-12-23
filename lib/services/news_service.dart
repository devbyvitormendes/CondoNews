import 'dart:convert';

import 'package:condo_news/domain/env/environment.dart';
import 'package:condo_news/domain/models/news_model.dart';
import 'package:condo_news/domain/models/response_page_model.dart';
import 'package:condo_news/services/base_service.dart';
import 'package:http/http.dart' as http;

class NewsService extends BaseService {
  Future<List<NewsModel>> getBreakingNews() async {
    await setAuthHeader();
    final response = await http.get(
        Uri.parse('${Environment.baseUrl}/v1/news/breaking'),
        headers: headers);

    if (response.statusCode == 200) {
      dynamic data = jsonDecode(utf8.decode(response.bodyBytes));
      ResponsePageModel pageModel = ResponsePageModel.fromJson(data);

      if (pageModel.content == null || pageModel.content == []) {
        return [];
      } else {
        return pageModel.content!.map((e) => NewsModel.fromMap(e)).toList();
      }
    } else {
      throw Exception('Falha ao buscar notícias');
    }
  }

  Future<List<NewsModel>> getNews() async {
    await setAuthHeader();
    final response = await http.get(Uri.parse('${Environment.baseUrl}/v1/news'),
        headers: headers);

    if (response.statusCode == 200) {
      dynamic data = jsonDecode(utf8.decode(response.bodyBytes));
      ResponsePageModel pageModel = ResponsePageModel.fromJson(data);

      if (pageModel.content == null || pageModel.content == []) {
        return [];
      } else {
        return pageModel.content!.map((e) => NewsModel.fromMap(e)).toList();
      }
    } else {
      throw Exception('Falha ao buscar notícias');
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
      throw Exception('Falha ao buscar notícias');
    }
  }
}
