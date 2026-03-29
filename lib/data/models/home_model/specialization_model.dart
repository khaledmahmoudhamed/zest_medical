import 'package:equatable/equatable.dart';

import '../../../core/constants/app_constants_keys.dart';

class Specialization extends Equatable {
  final int id;
  final String name;
  const Specialization({required this.id, required this.name});
  factory Specialization.fromJson(Map<String, dynamic> json) {
    return Specialization(
      id: json[ApiKeys.id] ?? 1,
      name: json[ApiKeys.name] ?? "unKnown",
    );
  }
  @override
  List<Object> get props => [id, name];
}
