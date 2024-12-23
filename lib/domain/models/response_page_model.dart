import 'dart:developer';

class ResponsePageModel {
  List<dynamic>? content;
  int number;
  int size;
  int totalElements;
  int totalPages;
  bool last;

  ResponsePageModel({
    this.content,
    this.number = 0,
    this.size = 0,
    this.totalElements = 0,
    this.totalPages = 0,
    this.last = false,
  });

  factory ResponsePageModel.fromJson(Map<String, dynamic> json) {
    return ResponsePageModel(
      content: json['content'],
      number: json['number'],
      size: json['size'],
      totalElements: json['totalElements'],
      totalPages: json['totalPages'],
      last: json['last'],
    );
  }

  factory ResponsePageModel.fromMap(Map<String, dynamic> json) {
    switch (json) {
      case {
          'content': final List<dynamic> content,
          'number': final int number,
          'size': final int size,
          'totalElements': final int totalElements,
          'totalPages': final int totalPages,
          'last': final bool last,
        }:
        return ResponsePageModel(
          content: content,
          number: number,
          size: size,
          totalElements: totalElements,
          totalPages: totalPages,
          last: last,
        );
      case _:
        log('JSON inválido: $json');
        throw ArgumentError('JSON inválido');
    }
  }
}
