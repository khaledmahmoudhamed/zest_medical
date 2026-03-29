import 'package:equatable/equatable.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';
import 'package:zest_medical/data/models/user_model/patient_appointments.dart';

class PatientModelData extends Equatable {
  final List<PatientAppointmentsModel> patientData;

  const PatientModelData({required this.patientData});
  factory PatientModelData.fromJson(Map<String, dynamic> data) {
    return PatientModelData(
      patientData: (data[ApiKeys.data] as List).map((appointment) {
        return PatientAppointmentsModel.fromJson(appointment);
      }).toList(),
    );
  }

  @override
  List<Object?> get props => [patientData];
}
