class NewsModel {
  String? id;
  String? title;
  String? content;
  String? image;
  bool? breaking;
  String? date;

  NewsModel({
    this.id,
    this.title,
    this.content,
    this.image,
    this.breaking,
    this.date,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      image: json['image'],
      breaking: json['breaking'],
      date: json['date'],
    );
  }

  factory NewsModel.fromMap(Map<String, dynamic> json) {
    switch (json) {
      case {
          'id': final String id,
          'title': final String title,
          'content': final String content, 
          'image': final String image,
          'breaking': final bool breaking,
          'date': final String date,
        }:
        return NewsModel(
          id: id,
          title: title,
          content: content,
          image: image,
          breaking: breaking,
          date: date,
        );
      case _:
        throw ArgumentError('JSON inválido');
    }
  }
}
