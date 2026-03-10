import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zest_medical/data/repositories/auth_cubit/auth_repository.dart';
import 'package:zest_medical/logic/auth_cubit/auth_state.dart';

import '../../data/models/home_model/doctor_info.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.appRepo}) : super(InitialAuthState()) {
    subscription = Connectivity().onConnectivityChanged.listen((status) {
      if (!status.contains(ConnectivityResult.none)) {
        if (state is GetProfileLoadingState) {
          getUserProfile();
        }
      }
    });
  }

  final AppRepository appRepo;
  StreamSubscription? subscription;
  @override
  Future<void> close() {
    subscription!.cancel();
    return super.close();
  }

  Future<void> register({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
    required String confirmPassword,
  }) async {
    emit(RegisterLoadingState());
    final response = await appRepo.register(
      name: name,
      email: email,
      phone: phone,
      gender: gender,
      password: password,
      confirmPassword: confirmPassword,
    );
    response.fold(
      (stringError) {
        emit(RegisterFailedState(error: stringError));
      },
      (successModel) {
        emit(RegisterSuccessState(model: successModel));
      },
    );
  }

  Future<void> login({required String email, required String password}) async {
    try {
      emit(LoginLoadingState());
      try {
        final response = await appRepo.login(email: email, password: password);
        response.fold(
          (stringError) {
            emit(LoginFailedState(error: stringError));
          },
          (successModel) {
            emit(LoginSuccessState(model: successModel));
          },
        );
      } catch (e) {
        emit(LoginFailedState(error: e.toString()));
      }
    } catch (e) {
      emit(
        LoginFailedState(
          error: "An unexpected error occurred. Please try again.",
        ),
      );
    }
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
    required String confirmPassword,
  }) async {
    emit(UpdateProfileLoadingState());
    final response = await appRepo.updateProfile(
      name: name,
      email: email,
      phone: phone,
      gender: gender,
      password: password,
      confirmPassword: confirmPassword,
    );
    response.fold(
      (error) {
        emit(UpdateProfileFailedState(error: error));
      },
      (successModel) {
        emit(UpdateProfileSuccessState(model: successModel));
      },
    );
  }

  Future<void> getUserProfile() async {
    emit(GetProfileLoadingState());
    try {
      final response = await appRepo.getUserProfileData();
      response.fold(
        (error) {
          emit(GetProfileFailedState(error: error));
        },
        (successModel) {
          emit(GetProfileSuccessState(model: successModel));
        },
      );
    } catch (e) {
      emit(
        GetProfileFailedState(
          error: "Something went wrong. Please check your connection.",
        ),
      );
    }
  }
}
