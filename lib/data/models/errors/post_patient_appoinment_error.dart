import 'package:equatable/equatable.dart';
import 'package:zest_medical/core/constants/app_constants_keys.dart';

class PostPatientAppointmentError extends Equatable {
  final String? doctorId;
  final String? startTime;

  const PostPatientAppointmentError({this.startTime, this.doctorId});

  factory PostPatientAppointmentError.fromJson(Map<String, dynamic> data) {
    String? getFirst(String key) {
      if (data[key] != null &&
          data[key] is List &&
          ((data[key] as List).isNotEmpty)) {
        return data[key][0].toString();
      }
      return null;
    }

    return PostPatientAppointmentError(
      startTime: getFirst(ApiKeys.startTime),
      doctorId: getFirst(ApiKeys.doctorId),
    );
  }

  @override
  List<Object?> get props => [doctorId, startTime];
}
