class SearchModel {
  final String urlToImag;

  final String title;

  final String description;

  SearchModel({
    required this.urlToImag,
    required this.title,
    required this.description
  });

  factory SearchModel.fromJSON(Map<String, dynamic> json) =>
      SearchModel(
        urlToImag: json['urlToImage'] ?? "",
        title: json['title'] ?? "",
        description: json['description'] ?? "",
      );
}