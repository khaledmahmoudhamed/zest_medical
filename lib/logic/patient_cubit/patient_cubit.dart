import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zest_medical/data/repositories/patient_repo.dart';
import 'package:zest_medical/logic/patient_cubit/patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  final PatientRepo patientRepo;
  PatientCubit({required this.patientRepo}) : super(PatientInitialState());

  Future<void> postAppointment({
    required int id,
    required String startTime,
  }) async {
    emit(state.copyWith(patientStatus: PatientStatus.loading));
    final response = await patientRepo.storeAppointment(
      id: id,
      startTime: startTime,
    );
    response.fold(
      (error) {
        emit(
          state.copyWith(
            patientStatus: PatientStatus.error,
            errorMessage: error,
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            patientStatus: PatientStatus.success,
            patientData: success,
          ),
        );
      },
    );
  }

  Future<void> getAllAppointments() async {
    emit(state.copyWith(patientStatus: PatientStatus.loading));
    final response = await patientRepo.getAllAppointments();
    response.fold(
      (error) {
        emit(
          state.copyWith(
            patientStatus: PatientStatus.error,
            errorMessage: error,
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            patientStatus: PatientStatus.success,
            patientList: success.patientData,
          ),
        );
      },
    );
  }

  Future<void> canceledAppointments(int id) async {
    final updatedList = List<int>.from(state.canceledIdList)..add(id);
    emit(state.copyWith(canceledIdList: updatedList));
  }
}
