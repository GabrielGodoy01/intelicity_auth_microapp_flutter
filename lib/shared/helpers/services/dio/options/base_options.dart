import 'package:dio/dio.dart';

final productBaseOptions = BaseOptions(
  baseUrl: '',
  connectTimeout: const Duration(seconds: 30),
  receiveTimeout: const Duration(seconds: 30),
);
