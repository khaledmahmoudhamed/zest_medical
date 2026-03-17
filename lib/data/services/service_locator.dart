import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:zest_medical/core/network/web_services.dart';
import 'package:zest_medical/data/repositories/auth_cubit/auth_repository.dart';
import 'package:zest_medical/data/repositories/doctor_repo/doctor_repo.dart';
import 'package:zest_medical/data/repositories/patient_repo.dart';
import 'package:zest_medical/logic/auth_cubit/auth_cubit.dart';
import 'package:zest_medical/logic/doctor_cubit/doctor_cubit.dart';
import 'package:zest_medical/logic/patient_cubit/patient_cubit.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => WebServices(dio: getIt()));
  getIt.registerLazySingleton(() => AppRepository(webServices: getIt()));
  getIt.registerLazySingleton(() => DoctorRepo(webServices: getIt()));
  getIt.registerLazySingleton(() => PatientRepo(webServices: getIt()));
  getIt.registerLazySingleton(() => AuthCubit(appRepo: getIt()));
  getIt.registerLazySingleton(() => DoctorCubit(appRepo: getIt()));
  getIt.registerLazySingleton(() => PatientCubit(patientRepo: getIt()));
}
