import 'package:equatable/equatable.dart';

import '../../../core/constants/app_constants_keys.dart';
import 'governorate_model.dart';

class City extends Equatable {
  final int id;
  final String name;
  final Governorate governorate;

  const City({required this.id, required this.name, required this.governorate});
  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json[ApiKeys.id] ?? 1,
      name: json[ApiKeys.name] ?? "unKnown",
      governorate: json[ApiKeys.governorate] != null
          ? Governorate.fromJson(json[ApiKeys.governorate])
          : Governorate.fromJson({}),
    );
  }
  @override
  List<Object> get props => [id, name, governorate];
}
