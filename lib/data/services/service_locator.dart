import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:zest_medical/core/network/web_services.dart';
import 'package:zest_medical/data/repositories/app_repository.dart';
import 'package:zest_medical/logic/auth_cubit/auth_cubit.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => WebServices(dio: getIt()));
  getIt.registerLazySingleton(() => AppRepository(webServices: getIt()));
  getIt.registerLazySingleton(() => AuthCubit(appRepo: getIt()));
}
