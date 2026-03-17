import 'package:equatable/equatable.dart';
import 'package:zest_medical/data/models/errors/post_patient_appoinment_error.dart';
import 'package:zest_medical/data/models/errors/update_profile_error_model.dart';

import '../../../core/constants/app_constants_keys.dart';

class ErrorModel extends Equatable {
  final String message;
  final UpdateFieldDataModel? error;
  final PostPatientAppointmentError? postPatientAppointmentError;
  const ErrorModel({
    required this.message,
    this.error,
    this.postPatientAppointmentError,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> jsonError) {
    return ErrorModel(
      message: jsonError[ApiKeys.message] ?? "An Error Occurred",
      error:
          jsonError[ApiKeys.data] != null &&
              jsonError[ApiKeys.data] is Map<String, dynamic>
          ? UpdateFieldDataModel.fromJson(jsonError[ApiKeys.data])
          : UpdateFieldDataModel.fromJson({}),
      postPatientAppointmentError:
          jsonError[ApiKeys.data] != null &&
              jsonError[ApiKeys.data] is Map<String, dynamic>
          ? PostPatientAppointmentError.fromJson(jsonError[ApiKeys.data])
          : PostPatientAppointmentError.fromJson({}),
    );
  }

  @override
  List<Object?> get props => [message, error, postPatientAppointmentError];
}
