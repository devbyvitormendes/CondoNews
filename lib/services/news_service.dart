import 'dart:convert';
import 'dart:developer';

import 'package:condo_news/domain/models/news_model.dart';
import 'package:condo_news/domain/models/response_model.dart';
import 'package:http/http.dart' as http;

class NewsService {

  Future<List<NewsModel>> getBreakingNews() async {
    final response = await http
        .get(Uri.parse('https://api.spaceflightnewsapi.net/v4/articles/?is_featured=true&limit=5'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));

      return ResponseModel.fromJson(data).results!;
    } else {
      throw Exception('Falha ao buscar notícias');
    }
  }

  Future<List<NewsModel>> getNews() async {
    final response = await http
        .get(Uri.parse('https://api.spaceflightnewsapi.net/v4/articles'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));

      return ResponseModel.fromJson(data).results!;
    } else {
      throw Exception('Falha ao buscar notícias');
    }
  }

  Future<NewsModel> getNewsById(int id) async {
    final response = await http
        .get(Uri.parse('https://api.spaceflightnewsapi.net/v4/articles/$id/'));

    log('buscando noticia: $id');
    log('response: ${response.statusCode}');

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));

      return NewsModel.fromMap(data);
    } else {
      throw Exception('Falha ao buscar notícias');
    }
  }
}
