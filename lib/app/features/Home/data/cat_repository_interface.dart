import 'package:lab/app/features/Home/cat.dart';

abstract interface class CatRepositoryInterface {
  Future<List<Cat>> getCats();
}
