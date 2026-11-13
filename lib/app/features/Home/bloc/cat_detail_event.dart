part of 'cat_detail_bloc.dart';

sealed class CatDetailEvent extends Equatable {
  const CatDetailEvent();

  @override
  List<Object> get props => [];
}

final class CatDetailLoad extends CatDetailEvent {
  const CatDetailLoad({required this.breedId});

  final String breedId;

  @override
  List<Object> get props => [breedId];
}
