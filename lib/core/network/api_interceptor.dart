import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';

import '../utils/app_router.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String? token = CacheHelper.user!.get(ApiKeys.token);
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = "Bearer $token";
    } else {
      options.headers.remove("Authorization");
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 500) {
      CacheHelper.user!.delete(ApiKeys.token);
      AppRouter.navigatorState.currentState!.pushNamed(AppRouter.login);
    }
    handler.next(err);
  }
}
