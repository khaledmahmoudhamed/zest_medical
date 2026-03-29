import 'package:equatable/equatable.dart';
import 'package:zest_medical/data/models/user_model/patient_appointments.dart';

enum PatientStatus { initial, loading, success, error }

class PatientState extends Equatable {
  final List<PatientAppointmentsModel> patientList;
  final List<int> canceledIdList;
  final PatientStatus patientStatus;
  final String? errorMessage;
  const PatientState({
    this.patientStatus = PatientStatus.initial,
    this.errorMessage,
    this.patientList = const [],
    this.canceledIdList = const [],
  });

  PatientState copyWith({
    PatientStatus? patientStatus,
    PatientAppointmentsModel? patientData,
    List<PatientAppointmentsModel>? patientList,
    List<int>? canceledIdList,
    String? errorMessage,
  }) {
    return PatientState(
      patientStatus: patientStatus ?? this.patientStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      patientList: patientList ?? this.patientList,
      canceledIdList: canceledIdList ?? this.canceledIdList,
    );
  }

  @override
  List<Object?> get props => [
    patientStatus,
    errorMessage,
    patientList,
    canceledIdList,
  ];
}

class PatientInitialState extends PatientState {
  @override
  List<Object?> get props => [
    patientStatus,
    errorMessage,
    patientList,
    canceledIdList,
  ];
}
