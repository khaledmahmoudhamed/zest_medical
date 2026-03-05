import 'package:equatable/equatable.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';

class UserModel extends Equatable {
  final List<UserData> getUserData;
  const UserModel({required this.getUserData /*required this.updateUserData*/});
  factory UserModel.fromJson(Map<String, dynamic> userData) {
    final dynamic data = userData[ApiKeys.data];
    if (data is List) {
      return UserModel(
        getUserData: data.map((e) => UserData.fromJson(e)).toList(),
      );
    } else if (data is Map<String, dynamic>) {
      return UserModel(getUserData: [UserData.fromJson(data)]);
    } else {
      return UserModel(getUserData: []);
    }
  }

  @override
  List<Object> get props => [getUserData /*updateUserData*/];
}

class UserData extends Equatable {
  final String name;
  final String phone;
  final String email;
  final String gender;

  const UserData({
    required this.phone,
    required this.name,
    required this.gender,
    required this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> jsonData) {
    return UserData(
      phone: jsonData[ApiKeys.phone] ?? "phone",
      name: jsonData[ApiKeys.name] ?? "name",
      email: jsonData[ApiKeys.email] ?? "email",
      gender: jsonData[ApiKeys.gender] ?? "male",
    );
  }

  @override
  List<Object> get props => [name, phone, gender, email];
}
