import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API {
  final Dio _dio = Dio();

  API() {
    _dio.options.baseUrl = "https://fyndme.net/api";
    _dio.interceptors.add(PrettyDioLogger(requestBody: true));
  }

  Dio get sendRequest => _dio;
}
