import 'package:dartz/dartz.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';
import 'package:zest_medical/core/network/end_points.dart';
import 'package:zest_medical/core/network/web_services.dart';
import 'package:zest_medical/core/utils/app_functions.dart';
import 'package:zest_medical/data/models/errors/error_model.dart';
import '../models/user_model/login_model.dart';
import '../models/user_model/register_model.dart';
import '../models/user_model/user_profile_model.dart';

class AppRepository {
  final WebServices webServices;
  AppRepository({required this.webServices});

  Future<Either<String, AuthModel>> register({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await webServices.post(
        EndPoints.register,
        data: {
          ApiKeys.name: name,
          ApiKeys.email: email,
          ApiKeys.phone: phone,
          ApiKeys.gender: gender,
          ApiKeys.password: password,
          ApiKeys.passwordConfirmation: confirmPassword,
        },
      );
      final registerResponse = AuthModel.fromJson(response);
      return right(registerResponse);
    } on ServerExceptions catch (e) {
      return left(e.errorModel.message);
    }
  }

  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      print("============= Repo: Calling WebServices");
      final response = await webServices.post(
        EndPoints.login,
        data: {ApiKeys.email: email, ApiKeys.password: password},
      );
      final user = LoginModel.fromJson(response);
      CacheHelper.user!.put(ApiKeys.token, user.data.token);
      return right(user);
    } on ServerExceptions catch (e) {
      return left(e.errorModel.message);
    } catch (e) {
      // This catches everything else (like parsing errors)
      return left("Unexpected error: $e");
    }
  }

  Future<Either<ErrorModel, UserModel>> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await webServices.post(
        EndPoints.updateProfile,
        data: {
          ApiKeys.name: name,
          ApiKeys.email: email,
          ApiKeys.phone: phone,
          ApiKeys.gender: gender,
          ApiKeys.password: password,
          ApiKeys.passwordConfirmation: confirmPassword,
        },
      );
      final user = UserModel.fromJson(response);
      return right(user);
    } on ServerExceptions catch (e) {
      return left(e.errorModel);
    }
  }

  Future<Either<String, UserModel>> getUserProfileData() async {
    try {
      final response = await webServices.get(EndPoints.userProfile);
      final rightResponse = UserModel.fromJson(response);
      return right(rightResponse);
    } on ServerExceptions catch (e) {
      return left(e.errorModel.message);
    } catch (e) {
      return left("An unexpected error occurred $e");
    }
  }
}
