part of 'tech_bloc.dart';

abstract class TechState extends Equatable {
  const TechState();
  
  @override
  List<Object> get props => [];
}

class TechInitial extends TechState {}
class TechLoadingState extends TechState {}

class TechLoadedState extends TechState {
  final List<NewsModel> newsList;
  const TechLoadedState({
    required this.newsList,
  });

  @override
  List<Object> get props => [newsList];
}

class TechErrorState extends TechState {
  final String errorMessage;
  const TechErrorState({
    required this.errorMessage,
  });
  @override
  List<Object> get props => [errorMessage];
}