import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp1/views/article.dart';
import 'package:newsapp1/views/mydrawer.dart';
import 'package:newsapp1/views/search.dart';
import 'package:newsapp1/views/start.dart';
import 'package:newsapp1/helper/data.dart';
import 'package:newsapp1/helper/news.dart';
import 'package:newsapp1/models/articalmodel.dart';
import 'package:newsapp1/models/categmodel.dart';
import'package:newsapp1/views/settings.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isArabic = false;
  List<CategModel> categories = [];
  late Future<List<ArticalModel>> articles;
  bool _loading = true;



  @override
  void initState() {
    super.initState();

    categories = getCategories();
    articles = News.getNews1();
  }



  Widget build(BuildContext context) {
    return Scaffold(
           drawer: MyDrawer(
           ),

        appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.settings_suggest_outlined,
                  // هنا يمكنك استبدالها بالأيقونة المطلوبة
                  color: Colors.red, // تغيير لون الأيقونة هنا
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: EdgeInsets.only(right: 40.0),
                child: Text(
                  'Discover~',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontFamily: 'AbrilFatface'),
                ),
              ),
            ])),
        body:
            SingleChildScrollView(
          child: Container(

              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Search...',
                            style: TextStyle(
                                fontFamily: 'AbrilFatface',
                                color: Colors.grey,
                                fontSize: 15.0),
                          ),
                          margin: EdgeInsets.only(left: 10.0),
                        ),
                        IconButton(
                            onPressed: () {
                              showSearch(
                                      context: context,
                                      delegate: NewSearchDelegate());
                            },
                            icon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),

                  ///category
                  Container(
                    height: 100.0,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            imageUrl: categories[index].imageUrl,
                            categname: categories[index].categname,
                          );
                        }),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text('Trending News~',
                        style: TextStyle(    color: Colors.black,
                            fontFamily: 'AbrilFatface ', fontSize: 20.0))
                  ]),

                  ///blog
                  SizedBox(
                    height: 20.0,
                  ),
                  FutureBuilder<List<ArticalModel>>(
                    future: articles,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          child: ListView.separated(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return ArticleTile(
                                  article: snapshot.data![index]);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider();
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(strokeWidth: 3.0, ),
                        );
                      }
                    },
                  ),
                ],

                //
                //                )
              )),
        ));
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categname;

  CategoryTile({this.imageUrl, this.categname});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: /*Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
        ),
        margin: EdgeInsets.only(right: 15.0),*/
         Stack(children: <Widget>[     Container(
           width: 160,
           height: 100,
           decoration: BoxDecoration(
             borderRadius:
             BorderRadius.circular(10.0), // Adjust the border radius
             // Border settings
           ),
           child: ClipRRect(
             borderRadius: BorderRadius.circular(8.0), // Rounded corners
             child: CachedNetworkImage(
               imageUrl: imageUrl,
               width: 160,
               // Adjust width to accommodate the border
               height: 100,
               fit: BoxFit.cover,
               placeholder: (context, url) => CircularProgressIndicator(strokeWidth: 1.0, ),
               errorWidget: (context, url, error) => Icon(Icons.error),
             ),
           ),
         ),
         /* Image.network(
            imageUrl,
            width: 180.0,
            height: 100.0,
            fit: BoxFit.cover,
          ),*/
          Container(
              width: 180.0,
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              alignment: Alignment.center,
              child: Text(
                categname,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500),
              ))
        ]),

    );
  }
}


class ArticleTile extends StatelessWidget {
  final ArticalModel article;

  ArticleTile({required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Articles(article: {
              'title': article.title,
              'publishedAt': article.publishedAt,
              'description': article.description,
              'urlToImage': article.urlToImage,
              'content':article.content,
              'author':article.author,
              'url':article.url,
            }),
          ),
        );

      },
      child: Stack(children: [
        Row(children: [
          Container(
            width: 100,
            height: 80,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(10.0), // Adjust the border radius
              // Border settings
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
              child: CachedNetworkImage(
                imageUrl: article.urlToImage,
                width: 90,
                // Adjust width to accommodate the border
                height: 80,
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(strokeWidth: 1.0, ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            width: MediaQuery.of(context).size.width * 0.6,
            height: 80,
            alignment: Alignment.center,
            child: Text(article.title, style: TextStyle(fontSize: 15,fontFamily: 'AbrilFatface'))
          ),

          // تباعد بين العنوان والصورة
        ])
      ]),
    );
  }
}
