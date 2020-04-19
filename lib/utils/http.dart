import 'package:dio/dio.dart';
BaseOptions options = new BaseOptions(
    baseUrl: "http://106.12.61.133:3000",
    connectTimeout: 5000,
    receiveTimeout: 3000,
);
Dio dio = new Dio(options);