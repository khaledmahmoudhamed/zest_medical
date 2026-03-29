import 'package:equatable/equatable.dart';
import '../../../core/constants/app_constants_keys.dart';
import 'doctor_info.dart';

class DoctorData extends Equatable {
  final int id;
  final String name;
  final List<Doctors> doctors;
  const DoctorData({
    required this.id,
    required this.name,
    required this.doctors,
  });

  factory DoctorData.fromJson(Map<String, dynamic> json) {
    return DoctorData(
      id: json[ApiKeys.id],
      name: json[ApiKeys.name],
      doctors: (json[ApiKeys.doctors] as List).map((doctor) {
        return Doctors.fromJson(doctor);
      }).toList(),
    );
  }
  @override
  List<Object> get props => [id, name, doctors];
}
