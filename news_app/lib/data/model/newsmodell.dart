class NewsModel {
  final String title;
  final String? image;
  final String? subTitle;
  final String? date;

  NewsModel(
      {required this.title,
      required this.image,
      required this.subTitle,
      required this.date});

  factory NewsModel.fromJson(json) {
    return NewsModel(
      title: json['title'],
      image: json['urlToImage'],
      subTitle: json['description'],
      date: json['publishedAt'],
    );
  }
}
