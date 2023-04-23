// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app_bloc/models/news_model.dart';
import 'package:news_app_bloc/repositories/tech_news_repo.dart';

part 'tech_event.dart';
part 'tech_state.dart';

class TechBloc extends Bloc<TechLoadedEvent, TechState> {
  TechRepo techRepo;
  TechBloc(
    this.techRepo,
  ) : super(TechLoadingState()) {
    on<TechLoadedEvent>((event, emit) async {
      try {
        var newsList = await techRepo.getNews();
        emit(TechLoadedState(newsList: newsList));
      } catch (e) {
        emit(TechErrorState(errorMessage: e.toString()));
      }
    });
  }
}
