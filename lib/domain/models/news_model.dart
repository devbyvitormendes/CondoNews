class NewsModel {
  int? id;
  String? title;
  String? content;
  String? urlToImage;
  String? date;

  NewsModel({
    this.id,
    this.title,
    this.content,
    this.urlToImage,
    this.date,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      title: json['title'],
      content: json['summary'],
      urlToImage: json['image_url'],
      date: json['published_at'],
    );
  }

  factory NewsModel.fromMap(Map<String, dynamic> json) {
    switch (json) {
      case {
          'id': final int id,
          'title': final String title,
          'summary': final String content, 
          'image_url': final String urlToImage,
          'published_at': final String date,
        }:
        return NewsModel(
          id: id,
          title: title,
          content: content,
          urlToImage: urlToImage,
          date: date,
        );
      case _:
        throw ArgumentError('JSON inválido');
    }
  }
}
