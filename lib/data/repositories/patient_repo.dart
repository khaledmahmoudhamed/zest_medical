import 'package:dartz/dartz.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';
import 'package:zest_medical/core/network/end_points.dart';
import 'package:zest_medical/core/network/web_services.dart';
import 'package:zest_medical/core/utils/app_functions.dart';
import 'package:zest_medical/data/models/user_model/patient_appointments.dart';
import 'package:zest_medical/data/models/user_model/patient_model_data.dart';

import '../models/errors/error_model.dart';

class PatientRepo {
  final WebServices webServices;

  PatientRepo({required this.webServices});

  Future<Either<String, PatientAppointmentsModel>> storeAppointment({
    required int id,
    required String startTime,
  }) async {
    try {
      final response = await webServices.post(
        EndPoints.postAppointment,
        data: {ApiKeys.doctorId: id, ApiKeys.startTime: startTime},
      );
      return right(PatientAppointmentsModel.fromJson(response));
    } on ServerExceptions catch (e) {
      return left(e.errorModel.message);
    }
  }

  Future<Either<String, PatientModelData>> getAllAppointments() async {
    try {
      final response = await webServices.get(EndPoints.getAppointment);
      return right(PatientModelData.fromJson(response));
    } on ServerExceptions catch (e) {
      return left(e.errorModel.message);
    }
  }
}
