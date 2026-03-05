import 'package:equatable/equatable.dart';
import 'package:zest_medical/data/models/user_model/user_records.dart';

sealed class MedicalState extends Equatable {}

class MedicalInitialState extends MedicalState {
  @override
  List<Object> get props => [];
}

class MedicalLoadingState extends MedicalState {
  @override
  List<Object> get props => [];
}

class MedicalSuccessState extends MedicalState {
  final List<UserMedicalRecords> records;
  MedicalSuccessState({required this.records});
  @override
  List<Object> get props => [records];
}

class MedicalFailedState extends MedicalState {
  @override
  List<Object> get props => [];
}
