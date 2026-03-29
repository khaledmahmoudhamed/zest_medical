import 'package:equatable/equatable.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';

class AuthModel extends Equatable {
  final String message;
  final AuthData data;
  const AuthModel({required this.message, required this.data});

  factory AuthModel.fromJson(Map<String, dynamic> jsonData) {
    return AuthModel(
      message: jsonData[ApiKeys.registerMessage],
      data: jsonData[ApiKeys.data] != null
          ? AuthData.fromJson(jsonData[ApiKeys.data])
          : AuthData.fromJson({}),
    );
  }

  @override
  List<Object> get props => [message];
}

class AuthData extends Equatable {
  final String token;
  final String userName;

  const AuthData({required this.token, required this.userName});

  factory AuthData.fromJson(Map<String, dynamic> jsonData) {
    return AuthData(
      token: jsonData[ApiKeys.token],
      userName: jsonData[ApiKeys.userName],
    );
  }

  @override
  List<Object> get props => [token, userName];
}
