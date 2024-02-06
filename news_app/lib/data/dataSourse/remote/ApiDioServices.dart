import 'package:dio/dio.dart';


import '../../model/newsModel.dart';
import 'constants.dart';
import 'dioConfig.dart';

class ApiDioServises{
  ApiDioServises._();
  static final ApiDioServises api=ApiDioServises._();
  Future<NewsResponse>fetchNewsData(String category)async{
    Dio dio=DioConfig.getDio();
    String url="top-headlines";
    Response response=await dio.get(url,queryParameters: {'country':'us','apiKey':apiKey,'category':category});
    if(response.statusCode==200){
      return NewsResponse.fromJson(response.data);
    }else{
      throw DioException(requestOptions: RequestOptions(baseUrl: baseUrl));
    }
  }


  Future<NewsResponse>SearchData(String data)async{
    Dio dio=DioConfig.getDio();
    String url="everything";
    Response response=await dio.get(url,queryParameters: {'q':data,'apikey':apiKey});
    if(response.statusCode==200){
      return NewsResponse.fromJson(response.data);
    }else{
      throw DioException(requestOptions: RequestOptions(baseUrl: baseUrl));
    }
  }
}
