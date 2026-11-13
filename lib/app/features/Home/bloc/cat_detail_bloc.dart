import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab/app/features/Home/cat.dart';
import 'package:lab/app/features/Home/data/cat_detail_repository_interface.dart';
import 'package:lab/di/di.dart';

part 'cat_detail_event.dart';
part 'cat_detail_state.dart';

class CatDetailBloc extends Bloc<CatDetailEvent, CatDetailState> {
  CatDetailBloc({required this.repository}) : super(CatDetailInitial()) {
    on<CatDetailLoad>(_loadBreed);
  }

  final CatDetailRepositoryInterface repository;

  Future<void> _loadBreed(
    CatDetailLoad event,
    Emitter<CatDetailState> emit,
  ) async {
    emit(CatDetailLoadInProgress());
    try {
      final breed = await repository.getBreed(event.breedId);
      emit(CatDetailLoadSuccess(breed: breed));
    } catch (exception, stackTrace) {
      emit(CatDetailLoadFailure(exception: exception));
      talker.handle(exception, stackTrace);
    }
  }
}
