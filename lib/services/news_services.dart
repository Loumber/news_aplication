import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:web_ant_project/models/news_response.dart';
import 'package:web_ant_project/models/pagination.dart';

part 'news_services.g.dart';

@RestApi(baseUrl: 'https://api.spaceflightnewsapi.net')
abstract class NewsService {
  factory NewsService(Dio dio) = _NewsService;

  @GET('/v4/articles/')
  Future<PaginationResponse<NewsResponse>> getNews();

  @GET('/v4/articles/{id}/')
  Future<NewsResponse> getNewsById(
    @Path('id') int id,
  );
}
