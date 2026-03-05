import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zest_medical/data/repositories/app_repository.dart';
import 'package:zest_medical/logic/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.appRepo}) : super(InitialAuthState()) {
    subscription = Connectivity().onConnectivityChanged.listen((status) {
      if (!status.contains(ConnectivityResult.none)) {
        if (state is ProfileAuthLoadingState) {
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
    emit(RegisterAuthLoadingState());
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
        emit(RegisterAuthFailedState(error: stringError));
      },
      (successModel) {
        emit(RegisterAuthSuccessState(model: successModel));
      },
    );
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginAuthLoadingState());
    final response = await appRepo.login(email: email, password: password);
    response.fold(
      (stringError) {
        emit(LoginAuthFailedState(error: stringError));
      },
      (successModel) {
        emit(LoginAuthSuccessState(model: successModel));
      },
    );
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
    required String confirmPassword,
  }) async {
    emit(UpdateProfileAuthLoadingState());
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
        emit(UpdateProfileAuthFailedState(error: error));
      },
      (successModel) {
        emit(UpdateProfileAuthSuccessState(model: successModel));
      },
    );
  }

  Future<void> getUserProfile() async {
    emit(ProfileAuthLoadingState());
    try {
      final response = await appRepo.getUserProfileData();
      response.fold(
        (error) {
          emit(ProfileAuthFailedState(error: error));
        },
        (successModel) {
          emit(ProfileAuthSuccessState(model: successModel));
        },
      );
    } catch (e) {
      emit(
        ProfileAuthFailedState(
          error: "Something went wrong. Please check your connection.",
        ),
      );
    }
  }
}
