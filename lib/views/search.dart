import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp1/helper/news.dart';
import 'package:newsapp1/helper/searchnews.dart';
import 'package:newsapp1/models/searchmodel.dart';

class NewSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Get.back();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // قم بعرض نتائج البحث هنا
    return FutureBuilder<List<SearchModel>>(
        future: SearchNews.searchNews(query),
        builder: (context,snapShot){
          if(snapShot.hasData)
            return ListView.builder(
                itemCount: snapShot.data!.length,
                itemBuilder: (context,i) =>
                    ListTile(
                      title: Text(snapShot.data![i].title),
                      subtitle: Text(snapShot.data![i].description),
                      leading: CircleAvatar(
                        foregroundImage: NetworkImage(snapShot.data![i].urlToImag),
                      ),
                    )
            );
          if(snapShot.hasError)
            return Center(
              child: Text('Error : ${snapShot.error}'),
            );
          return Center(
            child: CircularProgressIndicator(),
          );
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // قم بعرض اقتراحات البحث هنا (اختياري)
    return ListView(
      children: [
        ListTile(
          title: Text(''),
          onTap: () {
            query = '';
            showResults(context);
          },
        ),
        ListTile(
          title: Text(''),
          onTap: () {
            query = '';
            showResults(context);
          },
        ),
      ],
    );
  }
}
