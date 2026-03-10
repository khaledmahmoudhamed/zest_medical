import 'package:equatable/equatable.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';
import 'home_data_model.dart';

class HomeDoctorsModel extends Equatable {
  final String message;
  final List<DoctorData> doctorData;
  const HomeDoctorsModel({required this.message, required this.doctorData});
  factory HomeDoctorsModel.fromJson(Map<String, dynamic> json) {
    return HomeDoctorsModel(
      message: json[ApiKeys.message],
      doctorData: (json[ApiKeys.data] as List).map((data) {
        return DoctorData.fromJson(data);
      }).toList(),
    );
  }
  @override
  List<Object> get props => [message, doctorData];
}
