class NewsData {
  String? title;
  String? content;
  String? urlToImage;
  String? date;

  NewsData({
    this.title,
    this.content,
    this.urlToImage,
    this.date,
  });

  factory NewsData.fromJson(Map<String, dynamic> json) {
    return NewsData(
      title: json['title'],
      content: json['content'],
      urlToImage: json['urlToImage'],
      date: json['publishedAt'],
    );
  }
}
