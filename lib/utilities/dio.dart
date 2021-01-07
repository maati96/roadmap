import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = new Dio();
  dio.options.baseUrl = 'https://roadmap-django-api.herokuapp.com/';
  dio.interceptors.add(
    InterceptorsWrapper(onRequest: (RequestOptions options) async {
      options.headers['Accept'] = '*/*';
    }),
  );
  return dio;
}
