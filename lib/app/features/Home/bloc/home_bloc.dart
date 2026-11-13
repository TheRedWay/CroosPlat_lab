import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab/app/features/Home/cat.dart';
import 'package:lab/app/features/Home/data/cat_repository_interface.dart';
import 'package:lab/di/di.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.catRepository}) : super(HomeInitial()) {
    on<HomeLoad>(_homeLoad);
  }

  final CatRepositoryInterface catRepository;

  Future<void> _homeLoad(HomeLoad event, Emitter<HomeState> emit) async {
    try {
      if (state is! HomeLoadSuccess) {
        emit(HomeLoadInProgress());
      }
      final cats = await catRepository.getCats();
      emit(HomeLoadSuccess(cats: cats));
    } catch (exception, stackTrace) {
      emit(HomeLoadFailure(exception: exception));
      talker.handle(exception, stackTrace);
    } finally {
      if (event.completer case final completer?) {
        if (!completer.isCompleted) completer.complete();
      }
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    talker.handle(error, stackTrace);
  }
}
