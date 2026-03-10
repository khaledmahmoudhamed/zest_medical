import 'package:equatable/equatable.dart';
import 'package:zest_medical/data/models/home_model/specialization_model.dart';
import '../../../core/constants/app_constants_keys.dart';
import '../home_model/city_model.dart';

class Doctors extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String photo;
  final String gender;
  final String address;
  final String description;
  final String degree;
  final String startTime;
  final String endTime;
  final int appointPrice;
  final City city;
  final Specialization specialization;

  const Doctors({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.gender,
    required this.address,
    required this.description,
    required this.degree,
    required this.startTime,
    required this.endTime,
    required this.appointPrice,
    required this.city,
    required this.specialization,
  });

  factory Doctors.fromJson(Map<String, dynamic> json) {
    return Doctors(
      id: json[ApiKeys.id] ?? 0,
      name: json[ApiKeys.name] ?? "unKnown",
      email: json[ApiKeys.email] ?? "unKnown",
      phone: json[ApiKeys.phone] ?? "unKnown",
      photo: json[ApiKeys.photo] ?? "unKnown",
      gender: json[ApiKeys.gender] ?? "unKnown",
      address: json[ApiKeys.address] ?? "unKnown",
      description: json[ApiKeys.description] ?? "unKnown",
      degree: json[ApiKeys.degree] ?? "unKnown",
      startTime: json[ApiKeys.startTime] ?? "unKnown",
      endTime: json[ApiKeys.endTime] ?? "unKnown",
      appointPrice: json[ApiKeys.appointPrice] ?? 300,
      city: json[ApiKeys.city] != null
          ? City.fromJson(json[ApiKeys.city])
          : City.fromJson({}),
      specialization: json[ApiKeys.specialization] != null
          ? Specialization.fromJson(json[ApiKeys.specialization])
          : Specialization.fromJson({}),
    );
  }

  @override
  List<Object> get props => [
    id,
    name,
    email,
    phone,
    photo,
    gender,
    address,
    description,
    degree,
    startTime,
    endTime,
    appointPrice,
    city,
    specialization,
  ];
}
