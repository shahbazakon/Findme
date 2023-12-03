import 'package:dio/dio.dart';
import 'package:find_me/core/constants/local_storege_key.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API {
  final Dio _dio = Dio();

  Map<String, dynamic> headers = {
    "x-auth-token": sharedPreferences!.getString(LocaleStorageKey.xAuthToken),
  };

  API() {
    _dio.options.baseUrl = "https://fyndme.net/api";
    _dio.options.headers = headers;
    _dio.interceptors.add(PrettyDioLogger(requestBody: true));
  }

  Dio get sendRequest => _dio;
}
