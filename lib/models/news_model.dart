import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  late final String? title;
  late final String? author;
  late final String? content;
  late final String? publishedAt;
  late final String? description;
  late final String? urlToImage;
  late final String? url;

  NewsModel({
    required this.title,
    required this.author,
    required this.content,
    required this.publishedAt,
    required this.description,
    required this.urlToImage,
    required this.url,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
