
import 'dart:convert';


import'package:http/http.dart'as http;

import '../models/articalmodel.dart';
 class News{
   static Future<List<ArticalModel>> getNews1() async {
     var response = await http.get(
         Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2023-08-15&sortBy=publishedAt&apiKey=c82be86081c644c7a446f00341571261'));

     if (response.statusCode == 200) {
       Map<String, dynamic> json = jsonDecode(response.body);
       List<dynamic> articlesJson = json['articles'];
       List<ArticalModel> articles =
       articlesJson.map((item) => ArticalModel.fromjson(item)).toList();
       return articles;
     }
     else {
       print('Failed to load articles. Status code: ${response.statusCode}');
       print('Response body: ${response.body}');
       throw Exception('Failed to load articles');
     }
   }




 }
