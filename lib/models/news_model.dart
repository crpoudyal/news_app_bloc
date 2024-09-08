class NewsModel {
  late final String? title;
  late final String? sourceName;
  late final String? sourceIcon;
  late final String? content;
  late final String? pubDate;
  late final String? description;
  late final String? imageUrl;
  late final String? link;

  NewsModel({
    required this.title,
    required this.sourceName,
    required this.sourceIcon,
    required this.content,
    required this.pubDate,
    required this.description,
    required this.imageUrl,
    required this.link,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        title: json['title'] as String?,
        sourceName: json['source_name'] as String?,
        sourceIcon: json['source_icon'] as String?,
        content: json['content'] as String?,
        pubDate: json['pubDate'] as String?,
        description: json['description'] as String?,
        imageUrl: json['image_url'] as String?,
        link: json['link'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'source_name': sourceName,
        'source_icon': sourceIcon,
        'content': content,
        'pubDate': pubDate,
        'description': description,
        'image_url': imageUrl,
        'link': link
      };
}
