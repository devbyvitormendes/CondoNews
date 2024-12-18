import 'dart:developer';

import 'package:condo_news/domain/models/news_model.dart';

class ResponsePageModel {
  int? count;
  String? next;
  String? previous;
  List<NewsModel>? results;

  ResponsePageModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ResponsePageModel.fromJson(Map<String, dynamic> json) {
    return ResponsePageModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List<NewsModel>.from(json['results'].map((news) => NewsModel.fromMap(news))),
    );
  }

  factory ResponsePageModel.fromMap(Map<String, dynamic> json) {
    switch (json) {
      case {
          'count': final int count,
          'next': final String next,
          'previous': final String previous,
          'results': final List<NewsModel> results,
        }:
        return ResponsePageModel(
          count: count,
          next: next,
          previous: previous,
          results: results,
        );
      case _:
        log('JSON inválido: $json');
        throw ArgumentError('JSON inválido');
    }
  }
}
