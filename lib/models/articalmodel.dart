class ArticalModel {
  String author;
  String url;
  String title;
  String description;
  String content;
  String urlToImage;
  String publishedAt;

  ArticalModel({
    required this.url,
    required this.title,
    required this.author,
    required this.content,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
  });


    factory ArticalModel.fromjson(Map<String, dynamic>json){
    return ArticalModel(
      title: json['title'] as String? ?? '', // Handle null value here
      author: json['author'] as String? ?? '', // Handle null value here
      content: json['content'] as String? ?? '', // Handle null value here
      description: json['description'] as String? ?? '', // Handle null value here
      url: json['url'] as String? ?? '', // Handle null value here
      urlToImage: json['urlToImage'] as String? ?? '', // Handle null value here
      publishedAt: json['publishedAt'] as String? ?? '', // Handle null value here
    );


  }

}
