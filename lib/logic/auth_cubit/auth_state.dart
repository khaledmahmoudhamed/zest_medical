import 'package:equatable/equatable.dart';
import 'package:zest_medical/data/models/errors/update_profile_error_model.dart';
import '../../data/models/errors/error_model.dart';
import '../../data/models/home_model/doctor_info.dart';
import '../../data/models/home_model/home_recommended_model.dart';
import '../../data/models/user_model/login_model.dart';
import '../../data/models/user_model/register_model.dart';
import '../../data/models/user_model/user_profile_model.dart';

sealed class AuthState extends Equatable {}

class InitialAuthState extends AuthState {
  @override
  List<Object> get props => [];
}

class RegisterLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class RegisterSuccessState extends AuthState {
  final AuthModel model;
  RegisterSuccessState({required this.model});
  @override
  List<Object> get props => [model];
}

class RegisterFailedState extends AuthState {
  final String error;
  RegisterFailedState({required this.error});
  @override
  List<Object> get props => [error];
}

class LoginLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends AuthState {
  final LoginModel model;
  LoginSuccessState({required this.model});
  @override
  List<Object> get props => [model];
}

class LoginFailedState extends AuthState {
  final String error;
  LoginFailedState({required this.error});
  @override
  List<Object> get props => [error];
}

class UpdateProfileLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class UpdateProfileSuccessState extends AuthState {
  final UserModel model;
  UpdateProfileSuccessState({required this.model});
  @override
  List<Object> get props => [model];
}

class UpdateProfileFailedState extends AuthState {
  final ErrorModel error;
  UpdateProfileFailedState({required this.error});
  @override
  List<Object> get props => [error];
}

class GetProfileLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class GetProfileSuccessState extends AuthState {
  final UserModel model;
  GetProfileSuccessState({required this.model});
  @override
  List<Object> get props => [model];
}

class GetProfileFailedState extends AuthState {
  final String error;
  GetProfileFailedState({required this.error});
  @override
  List<Object> get props => [error];
}

class LoadingImageState extends AuthState {
  @override
  List<Object> get props => [];
}

class SuccessImageState extends AuthState {
  @override
  List<Object> get props => [];
}

class FailedImageState extends AuthState {
  @override
  List<Object> get props => [];
}
