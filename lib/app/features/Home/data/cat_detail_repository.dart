import 'package:dio/dio.dart';
import 'package:lab/app/features/Home/cat.dart';
import 'package:lab/app/features/Home/data/cat_detail_repository_interface.dart';
import 'package:lab/data/endpoints.dart';

class CatDetailRepository implements CatDetailRepositoryInterface {
  CatDetailRepository({required this.dio});

  final Dio dio;

  @override
  Future<CatBreed> getBreed(String id) async {
    final response = await dio.get<Map<String, dynamic>>(Endpoints.breed(id));
    final data = response.data;
    if (data == null) {
      throw const FormatException('API не вернул данные о породе.');
    }

    return CatBreed.fromJson(data);
  }
}
