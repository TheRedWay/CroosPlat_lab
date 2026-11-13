import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

void setUpDio({required Dio dio, required Talker talker}) {
  final apiKey = dotenv.env['THE_CAT_API_KEY'];
  if (apiKey == null || apiKey.isEmpty) {
    throw StateError('Укажи THE_CAT_API_KEY в локальном файле .env.');
  }

  dio.options.baseUrl = 'https://beta-api.thecatapi.com/v1';
  dio.options.headers['x-api-key'] = apiKey;
  dio.options.connectTimeout = const Duration(seconds: 5);
  dio.options.receiveTimeout = const Duration(seconds: 5);
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: false,
        printResponseData: false,
        hiddenHeaders: {'x-api-key'},
      ),
    ),
  );
}
