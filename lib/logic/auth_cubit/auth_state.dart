import 'package:equatable/equatable.dart';
import 'package:zest_medical/data/models/errors/error_model.dart';
import '../../data/models/user_model/login_model.dart';
import '../../data/models/user_model/register_model.dart';
import '../../data/models/user_model/user_profile_model.dart';

sealed class AuthState extends Equatable {}

class InitialAuthState extends AuthState {
  @override
  List<Object> get props => [];
}

class RegisterAuthLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class RegisterAuthSuccessState extends AuthState {
  final AuthModel model;
  RegisterAuthSuccessState({required this.model});
  @override
  List<Object> get props => [model];
}

class RegisterAuthFailedState extends AuthState {
  final String error;
  RegisterAuthFailedState({required this.error});
  @override
  List<Object> get props => [error];
}

class LoginAuthLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginAuthSuccessState extends AuthState {
  final LoginModel model;
  LoginAuthSuccessState({required this.model});
  @override
  List<Object> get props => [model];
}

class LoginAuthFailedState extends AuthState {
  final String error;
  LoginAuthFailedState({required this.error});
  @override
  List<Object> get props => [error];
}

class UpdateProfileAuthLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class UpdateProfileAuthSuccessState extends AuthState {
  final UserModel model;
  UpdateProfileAuthSuccessState({required this.model});
  @override
  List<Object> get props => [model];
}

class UpdateProfileAuthFailedState extends AuthState {
  final ErrorModel error;
  UpdateProfileAuthFailedState({required this.error});
  @override
  List<Object> get props => [error];
}

class ProfileAuthLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class ProfileAuthSuccessState extends AuthState {
  final UserModel model;
  ProfileAuthSuccessState({required this.model});
  @override
  List<Object> get props => [model];
}

class ProfileAuthFailedState extends AuthState {
  final String error;
  ProfileAuthFailedState({required this.error});
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
