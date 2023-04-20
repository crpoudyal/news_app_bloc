part of 'business_bloc.dart';

abstract class BusinessState extends Equatable {
  const BusinessState();
  
  @override
  List<Object> get props => [];
}

class BusinessInitial extends BusinessState {}

class BusinessLoadingState extends BusinessState {}

class BusinessLoadedState extends BusinessState {
  final List<NewsModel> newsList;
  const BusinessLoadedState({
    required this.newsList,
  });

  @override
  List<Object> get props => [newsList];
}

class BusinessErrorState extends BusinessState {
  final String errorMessage;
  const BusinessErrorState({
    required this.errorMessage,
  });
  @override
  List<Object> get props => [errorMessage];
}
