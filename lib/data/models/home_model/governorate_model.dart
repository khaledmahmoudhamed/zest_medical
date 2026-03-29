import 'package:equatable/equatable.dart';

import '../../../core/constants/app_constants_keys.dart';

class Governorate extends Equatable {
  final int id;
  final String name;
  const Governorate({required this.name, required this.id});
  factory Governorate.fromJson(Map<String, dynamic> json) {
    return Governorate(
      name: json[ApiKeys.name] ?? "unKnown",
      id: json[ApiKeys.id] ?? 1,
    );
  }
  @override
  List<Object> get props => [id, name];
}
