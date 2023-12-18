part of 'news_bloc.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  final List<News> news;

  NewsSuccess({
    required this.news,
  });
}

class NewsFailure extends NewsState {
  final String errorMessage;

  NewsFailure({required this.errorMessage});
}
