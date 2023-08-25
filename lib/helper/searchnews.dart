import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:newsapp1/models/searchmodel.dart';

class SearchNews{

  static Future<List<SearchModel>> searchNews(String query) async {
    var response = await http.get(
        Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=52489cf346804f2eb180b8e34528aa26&query=$query')

    );

    if (response.statusCode == 200) {
      List<SearchModel> newsList = [];
      Map<String, dynamic> json = jsonDecode(response.body);

      for (var item in json['articles']) {
        newsList.add(
          SearchModel.fromJSON(item),
        );
      }

      return newsList;
    } else {
      throw Exception('حدث خطأ أثناء جلب الأخبار');
    }
  }
}





