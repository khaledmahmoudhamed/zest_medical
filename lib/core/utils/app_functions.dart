import 'package:dio/dio.dart';
import 'package:zest_medical/data/models/errors/update_profile_error_model.dart';

import '../../data/models/errors/error_model.dart';

class ServerExceptions implements Exception {
  ErrorModel errorModel;

  ServerExceptions({required this.errorModel});
}

class AppFunctions {
  static void handleDioExceptions(DioException e) {
    print("=========== DioError caught: ${e.type}");
    if (e.response != null && e.response!.data != null) {
      print("=========== DioError caught: ${e.type}");
      if (e.response!.data is Map<String, dynamic>) {
        throw ServerExceptions(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );
      } else {
        throw ServerExceptions(
          errorModel: ErrorModel(
            message: e.response!.statusMessage ?? "Server Error",
          ),
        );
      }
    }
    switch (e.type) {
      case DioExceptionType.connectionError:
        print("=========== DioError caught: ${e.type}");
        throw ServerExceptions(
          errorModel: ErrorModel(
            message:
                "No Internet Connection Please. check your Wi-Fi or Mobile Data.",
          ),
        );
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        throw ServerExceptions(
          errorModel: ErrorModel(message: "Server took too long to respond"),
        );
      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
        throw ServerExceptions(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );
      case DioExceptionType.unknown:
        // Check if it's a socket/http exception
        if (e.message?.contains('HttpException') ?? false) {
          throw ServerExceptions(
            errorModel: ErrorModel(
              message: "Network connection was closed unexpectedly.",
            ),
          );
        }
        throw "An unexpected error occurred.";
      case DioExceptionType.badResponse:
        print("=========== DioError caught: ${e.type}");
        switch (e.response!.statusCode) {
          case 400:
          case 401:
          case 403:
          case 404:
          case 409:
          case 504:
            throw ServerExceptions(
              errorModel: ErrorModel.fromJson(e.response!.data),
            );
          case 500:
            throw ServerExceptions(
              errorModel: ErrorModel(
                message: "Server is currently under maintenance",
              ),
            );
          case 422:
            throw ServerExceptions(
              errorModel: ErrorModel.fromJson(e.response!.data),
            );
          default:
            throw ServerExceptions(
              errorModel: ErrorModel(message: "Something went wrong"),
            );
        }
    }
  }
}
