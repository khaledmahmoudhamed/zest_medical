import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zest_medical/logic/medical_cubit/medical_state.dart';

import '../../data/models/user_model/user_records.dart';

class MedicalCubit extends Cubit<MedicalState> {
  MedicalCubit() : super(MedicalInitialState());

  Future<void> getMedicalRecords() async {
    // emit(MedicalLoadingState());
    await Future.delayed(Duration(seconds: 1));
    final mockData = [
      UserMedicalRecords(
        date: "25 Feb",
        title: "End of observation",
        month: 'This Month',
      ),
      UserMedicalRecords(
        date: "18 Feb",
        title: "Blood Analysis",
        month: 'This Month',
        redBloodCells: " 4.10 million cells/mcL",
        hematocrit: "33.6%",
        hemoglobin: " 142 grams/L",
        whiteBloodCells: "3.850 cells/mcL",
      ),
      UserMedicalRecords(
        date: "20 Feb",
        title: "Blood Analysis",
        month: 'This Month',
        redBloodCells: " 3.90 million cells/mcL",
        hemoglobin: "122 grams/L",
        hematocrit: "47.7%",
        whiteBloodCells: "4.300 cells/mcL",
      ),
      UserMedicalRecords(
        date: "25 january",
        title: "End of observation",
        month: 'January',
      ),
      UserMedicalRecords(
        date: "20 March",
        title: "Blood Analysis",
        month: 'January',
        redBloodCells: " 3.90 million cells/mcL",
        hemoglobin: "122 grams/L",
        hematocrit: "47.7%",
        whiteBloodCells: "4.300 cells/mcL",
      ),
      UserMedicalRecords(
        date: "8 March",
        title: "Blood Analysis",
        month: 'January',
        redBloodCells: " 3.90 million cells/mcL",
        hemoglobin: "122 grams/L",
        hematocrit: "47.7%",
        whiteBloodCells: "4.300 cells/mcL",
      ),
    ];
    emit(MedicalSuccessState(records: mockData));
  }
}
