import 'package:dartz/dartz.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';
import 'package:zest_medical/core/network/end_points.dart';
import 'package:zest_medical/core/network/web_services.dart';
import 'package:zest_medical/core/utils/app_functions.dart';
import 'package:zest_medical/data/models/errors/update_profile_error_model.dart';
import 'package:zest_medical/data/models/home_model/doctor_info.dart';
import '../../models/doctor/all_doctors_model.dart';
import '../../models/errors/error_model.dart';
import '../../models/home_model/home_recommended_model.dart';
import '../../models/user_model/login_model.dart';
import '../../models/user_model/register_model.dart';
import '../../models/user_model/user_profile_model.dart';

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
      await CacheHelper.user!.put(ApiKeys.name, registerResponse.data.userName);
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
      await CacheHelper.user!.put(ApiKeys.name, user.getUserData[0].name);
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

  Future<Either<String, AllDoctorsModel>> getAllDoctors() async {
    try {
      final response = await webServices.get(EndPoints.allDoctors);
      final allDoctors = AllDoctorsModel.fromJson(response);
      return right(allDoctors);
    } on ServerExceptions catch (e) {
      return left(e.errorModel.message);
    } catch (e) {
      return left("An unexpected error occurred $e");
    }
  }

  Future<Either<String, HomeDoctorsModel>>
  getHomePageRecommendationDoctors() async {
    try {
      final response = await webServices.get(EndPoints.homeRecommendedDoctor);
      final homeDoctor = HomeDoctorsModel.fromJson(response);
      return right(homeDoctor);
    } on ServerExceptions catch (e) {
      return left(e.errorModel.message);
    }
  }
}
