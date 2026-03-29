import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn
          .authenticate();

      if (googleUser == null) return; // User canceled
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Google Sign-In Error: $e")));
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['public_profile', 'email'],
      );
      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final OAuthCredential credential = FacebookAuthProvider.credential(
          accessToken.tokenString,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
        print("User signed in successfully!");
      } else {
        print("Facebook login failed: ${result.message}");
      }
    } catch (e) {
      print("Error during Facebook login: $e");
    }
  }
}
