import 'package:dio/dio.dart';
import 'package:zest_medical/core/network/api_interceptor.dart';
import 'package:zest_medical/core/network/api_services.dart';
import 'package:zest_medical/core/network/end_points.dart';
import 'package:zest_medical/core/utils/app_functions.dart';

class WebServices extends ApiServices {
  Dio dio;
  WebServices({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        requestUrl: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
  }
  @override
  Future<dynamic> post(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    try {
      final response = await dio.post(
        endPoint,
        queryParameters: queryParameters,
        data: data,
      );
      return response.data;
    } on DioException catch (e) {
      AppFunctions.handleDioExceptions(e);
      rethrow;
    }
  }

  @override
  Future<dynamic> get(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    try {
      final response = await dio.get(
        endPoint,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      AppFunctions.handleDioExceptions(e);
      rethrow;
    }
  }
}
