import 'package:dio/dio.dart';
import 'package:lab/app/features/Home/cat.dart';
import 'package:lab/app/features/Home/data/cat_repository_interface.dart';
import 'package:lab/data/endpoints.dart';

class CatRepository implements CatRepositoryInterface {
  CatRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<Cat>> getCats() async {
    final response = await dio.get<List<dynamic>>(
      Endpoints.cats,
      queryParameters: {'limit': 10, 'has_breeds': 1},
    );
    final images = response.data;
    if (images == null) {
      throw const FormatException('API не вернул список изображений котиков.');
    }

    return images.map((image) {
      if (image is! Map<String, dynamic>) {
        throw const FormatException('Некорректное изображение в ответе API.');
      }
      final cat = Cat.fromJson(image);
      if (cat.breeds.isEmpty) {
        throw const FormatException(
          'API не вернул информацию о породе котика.',
        );
      }
      return cat;
    }).toList();
  }
}
