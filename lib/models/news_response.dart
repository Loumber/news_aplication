import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_ant_project/models/news.dart';

part 'news_response.freezed.dart';
part 'news_response.g.dart';

@Freezed()
class NewsResponse with _$NewsResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory NewsResponse({
    required int id,
    required String title,
    required String url,
    String? imageUrl,
    String? newsSite,
    required String summary,
    DateTime? publishedAt,
    DateTime? updatedAt,
    bool? featured,
    List<dynamic>? launches,
    List<dynamic>? events,
  }) = _NewsResponse;

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
}

News convertToNewsModel(NewsResponse response) {
  return News(
    id: response.id,
    createDate: response.publishedAt!,
    updateDate: response.updatedAt,
    title: response.title,
    description: response.summary,
    sourceUrl: response.url,
    imageUrl: response.imageUrl,
  );
}
