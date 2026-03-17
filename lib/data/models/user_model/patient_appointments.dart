import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';
import 'package:zest_medical/data/models/home_model/doctor_info.dart';

class PatientAppointmentsModel extends Equatable {
  final String startTime;
  final String endTime;
  final Doctors? doctor;
  final int id;

  const PatientAppointmentsModel({
    this.doctor,
    required this.endTime,
    required this.startTime,
    required this.id,
  });

  DateTime get startDateTime {
    try {
      return DateFormat("EEEE, MMMM dd, yyyy hh:mm a").parse(startTime);
    } catch (e) {
      return DateTime.now();
    }
  }

  bool get isUpComing => startDateTime.isAfter(DateTime.now());
  bool get isCompleted => startDateTime.isBefore(DateTime.now());
  factory PatientAppointmentsModel.fromJson(Map<String, dynamic> data) {
    return PatientAppointmentsModel(
      doctor: data[ApiKeys.doctor] != null
          ? Doctors.fromJson(data[ApiKeys.doctor])
          : null,
      endTime: data[ApiKeys.appointmentEndTime] ?? "end time",
      startTime: data[ApiKeys.appointmentTime] ?? "start time",
      id: data[ApiKeys.id] ?? 1,
    );
  }
  @override
  List<Object?> get props => [startTime, endTime, doctor, id];
}
