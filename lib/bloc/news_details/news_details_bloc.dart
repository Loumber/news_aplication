import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_ant_project/models/news.dart';
import 'package:web_ant_project/models/news_response.dart';
import 'package:web_ant_project/services/news_services.dart';




part  'news_details_event.dart';
part  'news_details_state.dart';

class NewsDetailsBloc extends Bloc<NewsDetailsEvent, NewsDetailsState> {
  NewsDetailsBloc({
    required this.newsService,
  }) : super(NewsDetailsInitialState()) {
    on<LoadNewsById>(_onNewsDetailsEvent);
    on<OpenNewsSourceLink>(_onOpenSourceSiteLink);
  }

  final NewsService newsService;

  Future<void> _onNewsDetailsEvent(
    LoadNewsById event,
    Emitter<NewsDetailsState> emit,
  ) async {
    try{
    emit(NewsDetailsLoadingState());

    final newsResponse = await newsService.getNewsById(event.id);

    final news =  convertToNewsModel(newsResponse);

    emit(
      NewsDetailsSuccessState(news: news),
    );}
    catch(error){
      emit(NewsDetailsFailureState(errorMessage: error.toString()));
    }
  }

  Future<void> _onOpenSourceSiteLink(
    OpenNewsSourceLink event,
    Emitter<NewsDetailsState> emit,
  ) async {
    try{
    final uri = Uri.tryParse(event.link);

    if (uri != null && uri.isAbsolute) {
      await launchUrl(uri);
    }
    }
    catch(error){
      emit(NewsDetailsFailureState(errorMessage: error.toString()));
    }
  }
}