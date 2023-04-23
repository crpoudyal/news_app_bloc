// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app_bloc/models/news_model.dart';
import 'package:news_app_bloc/repositories/business_news_repo.dart';

part 'business_event.dart';
part 'business_state.dart';

class BusinessBloc extends Bloc<BusinessLoadedEvent, BusinessState> {
  BusinessRepo businessRepo;
  BusinessBloc(
    this.businessRepo,
  ) : super(BusinessLoadingState()) {
    on<BusinessLoadedEvent>((event, emit) async {
      try {
        var newsList = await businessRepo.getNews();
        emit(BusinessLoadedState(newsList: newsList));
      } catch (e) {
        emit(BusinessErrorState(errorMessage: e.toString()));
      }
    });
  }
}
