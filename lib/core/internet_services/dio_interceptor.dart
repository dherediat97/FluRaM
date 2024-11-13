import 'package:dio/dio.dart';
import 'package:fluram/core/app/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider((ref) {
  final options = BaseOptions(baseUrl: AppConstants.baseUrl);
  final dio = Dio(options);
  if (!kReleaseMode) {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));
  }
  return dio;
});