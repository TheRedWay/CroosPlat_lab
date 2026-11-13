import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lab/app/features/Home/bloc/home_bloc.dart';
import 'package:lab/app/features/Home/data/cat_repository.dart';
import 'package:lab/app/features/Home/data/cat_repository_interface.dart';
import 'package:lab/data/dio/set_up.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

final getIt = GetIt.instance;
final talker = TalkerFlutter.init();
final Dio dio = Dio();

Future<void> setupLocator() async {
  getIt.registerSingleton(talker);
  Bloc.observer = TalkerBlocObserver(talker: talker);
  setUpDio(dio: dio, talker: talker);
  getIt.registerSingleton(dio);
  getIt.registerLazySingleton<CatRepositoryInterface>(
    () => CatRepository(dio: getIt<Dio>()),
  );
  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(catRepository: getIt<CatRepositoryInterface>()),
  );
}
