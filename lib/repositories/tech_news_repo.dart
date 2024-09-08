import 'dart:convert';

import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_app_bloc/models/news_model.dart';
import 'package:news_app_bloc/utils/app_url.dart';

class TechRepo {
  Future<List<NewsModel>> getNews() async {
    final response = await http.get(Uri.parse(AppUrl.techNewsUrl));

    // Decode the response body using utf8.decode
    var decodedResponse = utf8.decode(response.bodyBytes);

    var data = jsonDecode(decodedResponse);
    List<NewsModel> newsModelList = [];
    log('data : ${data['results']}');

    if (response.statusCode == 200) {
      data['results'].forEach((e) {
        newsModelList.add(NewsModel.fromJson(e));
      });

      return newsModelList;
    } else {
      return newsModelList;
    }
  }
}
