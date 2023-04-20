// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<NewsModel> newsList;
  const NewsLoadedState({
    required this.newsList,
  });

  @override
  List<Object> get props => [newsList];
}

class NewsErrorState extends NewsState {
  final String errorMessage;
  const NewsErrorState({
    required this.errorMessage,
  });
  @override
  List<Object> get props => [errorMessage];
}
