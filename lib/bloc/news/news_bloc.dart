import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:web_ant_project/models/news.dart';
import 'package:web_ant_project/models/news_response.dart';
import 'package:web_ant_project/services/news_services.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(this.newsService) : super(NewsInitial()) {
    on<LoadNews>(_onLoadNews);
  }

  final NewsService newsService;

  Future<void> _onLoadNews(
    LoadNews event,
    Emitter<NewsState> emit,
  ) async {
    emit(NewsLoading());

    await Future.delayed(Duration(seconds: 3));

    try {
      final pagination = await newsService.getNews();

      final news = pagination.results?.map(convertToNewsModel).toList();

      if (news != null) {
        emit(NewsSuccess(news: news));
      } else {
        emit(NewsFailure(errorMessage: 'Не получилось загрузить новости'));
      }
    } catch (error) {
      emit(NewsFailure(errorMessage: error.toString()));
    }
  }
}
