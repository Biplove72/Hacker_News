

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsproject/models/comments.dart';

    final commentProvider = StateNotifierProvider((ref) => Comment());
    final commentP = Provider((ref) => cmntList);
    List<Comments> cmntList = [];

    class Comment extends StateNotifier<List<Comments>> {
      Comment() : super([]);

      Future<void> getComment({List? kids}) async {
        final dio = Dio();
        try {
          if (kids != null) {
            for (var i = 0; i < kids.length; i++) {
              int comment = await kids[i];

              final news = await dio.get(
                  "https://hacker-news.firebaseio.com/v0/item/$comment.json?print=pretty");

          //   Map<String, dynamic> map = news.data;
              final data = await Comments.fromJson(news.data);
              cmntList.add(data);
            }
            state = cmntList;
          }
        } on DioError catch (e) {
          print(e.error);
        }
      }
    }
