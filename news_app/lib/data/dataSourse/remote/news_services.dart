import 'package:dio/dio.dart';
import '../../model/newsmodell.dart';

class NewsServices {
  final Dio dio;
   final String path = "https://newsapi.org/v2";
   final String country = 'us';
   final String apiKey = '3c88955c487e4d9db668f011dd85e737';

  NewsServices(this.dio);

    Future<List<NewsModel>> getTopHeadLine({required String category}) async {
    try {
      var response = await dio.get(
          '$path/top-headlines?country=$country&apiKey=$apiKey&category=$category');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> news = jsonData['articles'];
      List<NewsModel> newsList = [];
      for (var oneNews in news) {
        NewsModel newsModel = NewsModel.fromJson(oneNews);
        newsList.add(newsModel);
      }

      return newsList;
    } catch (e) {
      return [];
    }
  }
}
