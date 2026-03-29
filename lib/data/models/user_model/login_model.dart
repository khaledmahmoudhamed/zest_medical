import 'package:equatable/equatable.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';

class LoginModel extends Equatable {
  final String message;
  final LoginData data;

  const LoginModel({required this.message, required this.data});
  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
      message: jsonData[ApiKeys.loginMessage],
      data: jsonData[ApiKeys.data] != null
          ? LoginData.fromJson(jsonData[ApiKeys.data])
          : LoginData.fromJson({}),
    );
  }
  @override
  List<Object> get props => [message, data];
}

class LoginData extends Equatable {
  final String token;
  final String userName;

  const LoginData({required this.token, required this.userName});

  factory LoginData.fromJson(Map<String, dynamic> jsonData) {
    return LoginData(
      token: jsonData[ApiKeys.token],
      userName: jsonData[ApiKeys.userName],
    );
  }

  @override
  List<Object> get props => [token, userName];
}
