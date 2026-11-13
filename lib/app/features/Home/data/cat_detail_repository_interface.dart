import 'package:lab/app/features/Home/cat.dart';

abstract interface class CatDetailRepositoryInterface {
  Future<CatBreed> getBreed(String id);
}
