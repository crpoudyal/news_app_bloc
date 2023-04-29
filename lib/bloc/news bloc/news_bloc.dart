// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app_bloc/models/news_model.dart';
import 'package:news_app_bloc/repositories/news_repo.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsLoadedEvent, NewsState> {
  NewsRepo newsRepo;
  NewsBloc(
    this.newsRepo,
  ) : super(NewsLoadingState()) {
    on<NewsLoadedEvent>((event, emit) async {
      try {
        var newsList = await newsRepo.getNews();
        emit(NewsLoadedState(newsList: newsList));
      } catch (e) {
        emit(NewsErrorState(errorMessage: e.toString()));
      }
    });
  }
}
