import 'package:equatable/equatable.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';

import '../home_model/doctor_info.dart';

class AllDoctorsModel extends Equatable {
  final String message;
  final List<Doctors> doctorData;
  const AllDoctorsModel({required this.message, required this.doctorData});

  factory AllDoctorsModel.fromJson(Map<String, dynamic> json) {
    return AllDoctorsModel(
      message: json[ApiKeys.message],
      doctorData: (json[ApiKeys.data] as List).map((doctor) {
        return Doctors.fromJson(doctor);
      }).toList(),
    );
  }
  @override
  List<Object?> get props => [message, doctorData];
}
