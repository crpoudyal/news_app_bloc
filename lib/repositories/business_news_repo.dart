import 'dart:convert';

import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_app_bloc/models/news_model.dart';
import 'package:news_app_bloc/utils/app_url.dart';

class BusinessRepo {
  Future<List<NewsModel>> getNews() async {
    final dynamic response = await http.get(Uri.parse(AppUrl.businessNewsUrl));

    var data = jsonDecode(response.body);
    List<NewsModel> newsModelList = [];
    log('data : ${data['articles']}');

    if (response.statusCode == 200) {
      data['articles'].forEach((e) {
        newsModelList.add(NewsModel.fromJson(e));
      });

      // log(" news List : ${newsModelList.forEach((element) { })}");
      // for (var element in newsModelList) {
      //   log("${element.title}");
      // }
      return newsModelList;
    } else {
      return newsModelList;
    }
  }
}
