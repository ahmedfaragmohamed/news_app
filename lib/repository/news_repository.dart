import 'package:dio/dio.dart';

class NewsRepository{
  final _dio = Dio();
  Future<Response> getTopBusinessNews() async{
    Response res = await _dio.get("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=1cdd3ed682b944939f44af7e6cdef54f");
    return res;
  }
}