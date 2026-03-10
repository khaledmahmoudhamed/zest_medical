import 'package:equatable/equatable.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';

class ErrorModel extends Equatable {
  final String message;
  final UpdateFieldDataModel? errors;
  const ErrorModel({required this.message, this.errors});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonError) {
    return ErrorModel(
      message: jsonError[ApiKeys.message] ?? "An Error Occurred",
      errors:
          jsonError[ApiKeys.data] != null &&
              jsonError[ApiKeys.data] is Map<String, dynamic>
          ? UpdateFieldDataModel.fromJson(jsonError[ApiKeys.data])
          : UpdateFieldDataModel.fromJson({}),
    );
  }

  @override
  List<Object?> get props => [message, errors];
}

class UpdateFieldDataModel extends Equatable {
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  final String? confirmPass;

  const UpdateFieldDataModel({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.confirmPass,
  });

  factory UpdateFieldDataModel.fromJson(Map<String, dynamic> json) {
    String? getFirst(String key) {
      if (json[key] != null &&
          (json[key] is List) &&
          (json[key] as List).isNotEmpty) {
        return json[key][0].toString();
      }
      return null;
    }

    return UpdateFieldDataModel(
      name: getFirst(ApiKeys.name),
      email: getFirst(ApiKeys.email),
      phone: getFirst(ApiKeys.phone),
      password: getFirst(ApiKeys.password),
      confirmPass: getFirst(ApiKeys.passwordConfirmation),
    );
  }

  @override
  List<Object?> get props => [name, email, phone, password, confirmPass];
}
