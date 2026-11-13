part of 'cat_detail_bloc.dart';

sealed class CatDetailState extends Equatable {
  const CatDetailState();

  @override
  List<Object> get props => [];
}

final class CatDetailInitial extends CatDetailState {}

final class CatDetailLoadInProgress extends CatDetailState {}

final class CatDetailLoadSuccess extends CatDetailState {
  const CatDetailLoadSuccess({required this.breed});

  final CatBreed breed;

  @override
  List<Object> get props => [breed];
}

final class CatDetailLoadFailure extends CatDetailState {
  const CatDetailLoadFailure({required this.exception});

  final Object exception;

  @override
  List<Object> get props => [exception];
}
