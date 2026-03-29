import 'package:equatable/equatable.dart';

class UserMedicalRecords extends Equatable {
  final String date;
  final String month;
  final String title;
  final String? redBloodCells;
  final String? hemoglobin;
  final String? hematocrit;
  final String? whiteBloodCells;

  const UserMedicalRecords({
    required this.date,
    required this.month,
    required this.title,
    this.hematocrit,
    this.hemoglobin,
    this.redBloodCells,
    this.whiteBloodCells,
  });

  @override
  List<Object> get props => [
    date,
    title,
    redBloodCells!,
    hemoglobin!,
    hematocrit!,
    whiteBloodCells!,
    month,
  ];
}
