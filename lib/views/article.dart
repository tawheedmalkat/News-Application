/*
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/articalmodel.dart';
class Articles extends StatefulWidget {
  final ArticalModel articlemodel;



  Articles({required this.articlemodel});



  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("YourArticle"),centerTitle: true,),
      body: Container(
        child: WebView(

          initialUrl:  widget.articlemodel.url,
          onWebViewCreated: (WebViewController webViewController){
            _controller.complete(webViewController);
          },

        ),
      ),
    );
  }
}
*//*import 'package:flutter/material.dart';*/
/*
class Articles extends StatelessWidget {
  final Map<String, dynamic> article;

  Articles({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 30.0,),
            // Displaying the article image if a valid URL is provided
            if (article['urlToImage'] != null && article['urlToImage'].isNotEmpty)
              Image.network(article['urlToImage']),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Displaying the article title
                  Text(
                    article['title'] ?? '',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  // Displaying the published date
                  Text(
                    article['publishedAt'] ?? '',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  // Displaying the article description
                  Text(article['description'] ?? '', style: TextStyle(fontSize: 10, ),),

                  SizedBox(height: 16),
                  Text(article['content'] ?? '', style: TextStyle(fontSize: 20, ),),
                  SizedBox(height: 16),
                  Text(article['author'] ?? '', style: TextStyle(fontSize: 20, ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Articles extends StatelessWidget {
  final Map<String, dynamic> article;

  Articles({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.red),
        backgroundColor: Colors.white,
        elevation: 3.0,
        centerTitle: true,
        title: Text('Article Details~',style: TextStyle(color: Colors.black,fontSize: 20.0),),
      ),
      body: SingleChildScrollView(
        reverse: true,


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [



            // Displaying the WebView for full article content
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height, // Adjust the height as needed
                  child: WebView(
                    initialUrl: article['url'] ?? '',
                    javascriptMode: JavascriptMode.unrestricted,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

