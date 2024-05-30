import 'dart:io';

import 'package:crypto_currencies_test_app/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CoinCapAuthInterceptor extends Interceptor {
  final DotEnv _dotEnv;

  const CoinCapAuthInterceptor({required DotEnv dotEnv}) : _dotEnv = dotEnv;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final apiToken = _dotEnv.env[AppConstants.coinCapApiKey];

    if (apiToken != null) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $apiToken';
    } else {
      handler.reject(DioException(requestOptions: options, message: 'Bearer token not found'));
    }

    return handler.next(options);
  }
}
