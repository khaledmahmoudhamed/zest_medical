import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zest_medical/data/repositories/doctor_repo/doctor_repo.dart';
import 'package:zest_medical/logic/doctor_cubit/doctor_state.dart';

import '../../data/models/home_model/doctor_info.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit({required this.appRepo}) : super(InitialDoctorState()) {
    subscription = Connectivity().onConnectivityChanged.listen((status) {
      if (!status.contains(ConnectivityResult.none)) {}
    });
  }

  final DoctorRepo appRepo;
  StreamSubscription? subscription;
  @override
  Future<void> close() {
    subscription!.cancel();
    return super.close();
  }

  Future<void> homeRecommendedDoctors() async {
    if (state.homeRecommendedDoctorsList.isNotEmpty) return;
    emit(state.copyWith(homeStatus: DoctorStatus.loading));
    final response = await appRepo.homeRecommendedDoctors();
    response.fold(
      (error) {
        emit(state.copyWith(error: error, homeStatus: DoctorStatus.failed));
      },
      (success) {
        List<Doctors> recommendedDoctors = [];
        for (var specialization in success.doctorData) {
          recommendedDoctors.addAll(specialization.doctors);
        }

        emit(
          state.copyWith(
            homeRecommendedDoctorsList: recommendedDoctors,
            homeStatus: DoctorStatus.loaded,
          ),
        );
      },
    );
  }

  List getSpecializationsImage() {
    final response = appRepo.getDiseasesImages();
    return response;
  }

  Future<void> getAllDoctors() async {
    if (state.allDoctorsList.isNotEmpty) return;
    emit(state.copyWith(recommendedDoctorStatus: DoctorStatus.loading));
    final response = await appRepo.getAllDoctors();
    response.fold(
      (error) {
        emit(
          state.copyWith(
            error: error,
            recommendedDoctorStatus: DoctorStatus.failed,
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            allDoctorsList: success.doctorData,
            displayedDoctorsList: success.doctorData,
            recommendedDoctorStatus: DoctorStatus.loaded,
          ),
        );
      },
    );
  }

  Future<void> filterDoctorsByCity(int id) async {
    emit(
      state.copyWith(
        filterDoctorStatus: DoctorStatus.loading,
        checkedCityId: id,
      ),
    );
    final response = await appRepo.filterByCity(id);
    response.fold(
      (error) {
        emit(
          state.copyWith(filterDoctorStatus: DoctorStatus.failed, error: error),
        );
      },
      (success) {
        emit(
          state.copyWith(
            filterDoctorStatus: DoctorStatus.loaded,
            displayedDoctorsList: success.doctorData,
          ),
        );
      },
    );
  }

  Future<void> filterDoctorsBySpeciality(int id) async {
    emit(
      state.copyWith(
        filterDoctorStatus: DoctorStatus.loading,
        checkedSpecialityId: id,
      ),
    );
    final response = await appRepo.filterBySpeciality(id);
    response.fold(
      (error) {
        emit(
          state.copyWith(filterDoctorStatus: DoctorStatus.failed, error: error),
        );
      },
      (success) {
        emit(
          state.copyWith(
            filterDoctorStatus: DoctorStatus.loaded,
            displayedDoctorsList: success.doctorData,
          ),
        );
      },
    );
  }

  Future<void> searchDoctors(String name) async {
    if (name.isEmpty) {
      emit(state.copyWith(displayedDoctorsList: state.allDoctorsList));
      return;
    }
    emit(state.copyWith(searchDoctorStatus: DoctorStatus.loading));
    final response = await appRepo.searchDoctors(name);
    response.fold(
      (error) {
        emit(
          state.copyWith(searchDoctorStatus: DoctorStatus.failed, error: error),
        );
      },
      (success) {
        emit(
          state.copyWith(
            searchDoctorStatus: DoctorStatus.loaded,
            displayedDoctorsList: success.doctorData,
          ),
        );
      },
    );
  }

  //
  // Future<void> getAllSpecialization() async {
  //   emit(GetAllSpecializationLoadingState());
  //
  //   final response = await appRepo.getAllSpecializations();
  //   response.fold(
  //     ((left) {
  //       emit(GetAllSpecializationFailedState(message: left));
  //     }),
  //     (right) {
  //       emit(GetAllSpecializationSuccessState(model: right));
  //     },
  //   );
  // }
}
