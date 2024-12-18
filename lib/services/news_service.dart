import 'dart:convert';
import 'dart:developer';

import 'package:condo_news/domain/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsService {
  Map<String, String> headers = {
    'Access-Control-Allow-Origin': '*',
    'Accept': '*/*',
  };

  Future<List<NewsModel>> getBreakingNews() async {
    log('start searching breaking news');
    final response = await http.get(
        Uri.parse('http://127.0.0.1:8989/api/v1/news/breaking'),
        headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));

      return data.map((e) => NewsModel.fromMap(e)).toList();
    } else {
      throw Exception('Falha ao buscar notícias');
    }
  }

  Future<List<NewsModel>> getNews() async {
    log('start searching all news');
    final response = await http
        .get(Uri.parse('http://127.0.0.1:8989/api/v1/news'), headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));

      return data.map((e) => NewsModel.fromMap(e)).toList();
    } else {
      throw Exception('Falha ao buscar notícias');
    }
  }

  Future<NewsModel> getNewsById(int id) async {
    log('start searching news');
    final response = await http.get(
        Uri.parse('http://127.0.0.1:8989/api/v1/news/$id/'),
        headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(utf8.decode(response.bodyBytes));

      return NewsModel.fromMap(data);
    } else {
      throw Exception('Falha ao buscar notícias');
    }
  }
}
