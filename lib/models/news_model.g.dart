// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      urlToImage: json['urlToImage'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'urlToImage': instance.urlToImage,
      'url': instance.url,
    };
