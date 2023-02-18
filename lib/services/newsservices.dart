import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/newsclass.dart';
final newsProvider = StateNotifierProvider<NewsProvider, List<NewsItems>>(
        (ref) => NewsProvider());


List<NewsItems> newsItems = [];
late  List  idList =[];
class NewsProvider extends StateNotifier<List<NewsItems>> {
  NewsProvider() : super([]) {
    getNews();
  }


  Future getNews() async {
    final dio = Dio();
    try {
      final response = await dio.get(
          'https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty');
      idList = response.data;
      //print(idList);
      print(idList.length);

      for (int i = 0; i < 10; i++) {
        int id = idList[i];
        print(id);
        final newsdata = await dio.get(
            "https://hacker-news.firebaseio.com/v0/item/$id.json?print=pretty");
        NewsItems news = NewsItems.fromJson(newsdata.data);
        newsItems.add(news);
      }
      state = newsItems;
    } on DioError catch (e) {
      print(e.error);
    }
  }
}

