import 'package:equatable/equatable.dart';
import '../../data/models/home_model/doctor_info.dart';
import '../../data/models/home_model/home_data_model.dart';

enum DoctorStatus { initial, loading, loaded, failed }

class DoctorState extends Equatable {
  final List<DoctorData> allSpecializationList;
  final List<Doctors> homeRecommendedDoctorsList;
  final List<Doctors> allDoctorsList;
  final List<Doctors> filteredDoctorsList;
  final List<Doctors> searchDoctorsList;
  final List<Doctors> displayedDoctorsList;
  final DoctorStatus homeStatus;
  final DoctorStatus recommendedDoctorStatus;
  final DoctorStatus filterDoctorStatus;
  final DoctorStatus searchDoctorStatus;
  final DoctorStatus allSpecializationStatus;
  final String? error;
  final int checkedCityId;
  final int checkedSpecialityId;

  const DoctorState({
    this.error,
    this.allDoctorsList = const [],
    this.homeRecommendedDoctorsList = const [],
    this.filteredDoctorsList = const [],
    this.searchDoctorsList = const [],
    this.displayedDoctorsList = const [],
    this.allSpecializationList = const [],
    this.homeStatus = DoctorStatus.initial,
    this.recommendedDoctorStatus = DoctorStatus.initial,
    this.filterDoctorStatus = DoctorStatus.initial,
    this.searchDoctorStatus = DoctorStatus.initial,
    this.checkedCityId = 36,
    this.checkedSpecialityId = 1,
    this.allSpecializationStatus = DoctorStatus.initial,
  });

  DoctorState copyWith({
    List<Doctors>? homeRecommendedDoctorsList,
    List<DoctorData>? allSpecializationList,
    List<Doctors>? allDoctorsList,
    List<Doctors>? filteredDoctorsList,
    List<Doctors>? searchDoctorsList,
    List<Doctors>? displayedDoctorsList,
    DoctorStatus? homeStatus,
    DoctorStatus? recommendedDoctorStatus,
    DoctorStatus? filterDoctorStatus,
    DoctorStatus? searchDoctorStatus,
    DoctorStatus? allSpecializationStatus,
    String? error,
    int? checkedCityId,
    int? checkedSpecialityId,
  }) {
    return DoctorState(
      error: error ?? this.error,
      homeRecommendedDoctorsList:
          homeRecommendedDoctorsList ?? this.homeRecommendedDoctorsList,
      allDoctorsList: allDoctorsList ?? this.allDoctorsList,
      homeStatus: homeStatus ?? this.homeStatus,
      recommendedDoctorStatus:
          recommendedDoctorStatus ?? this.recommendedDoctorStatus,
      filteredDoctorsList: filteredDoctorsList ?? this.filteredDoctorsList,
      allSpecializationList:
          allSpecializationList ?? this.allSpecializationList,
      filterDoctorStatus: filterDoctorStatus ?? this.filterDoctorStatus,
      searchDoctorsList: searchDoctorsList ?? this.searchDoctorsList,
      searchDoctorStatus: searchDoctorStatus ?? this.searchDoctorStatus,
      allSpecializationStatus:
          allSpecializationStatus ?? this.allSpecializationStatus,
      displayedDoctorsList: displayedDoctorsList ?? this.displayedDoctorsList,
      checkedCityId: checkedCityId ?? this.checkedCityId,
      checkedSpecialityId: checkedSpecialityId ?? this.checkedSpecialityId,
    );
  }

  @override
  List<Object?> get props => [
    error,
    recommendedDoctorStatus,
    homeStatus,
    homeRecommendedDoctorsList,
    allDoctorsList,
    filteredDoctorsList,
    filterDoctorStatus,
    searchDoctorsList,
    searchDoctorStatus,
    displayedDoctorsList,
    checkedCityId,
    checkedSpecialityId,
    allSpecializationList,
    allSpecializationStatus,
  ];
}

class InitialDoctorState extends DoctorState {
  @override
  List<Object> get props => [
    error!,
    recommendedDoctorStatus,
    homeStatus,
    homeRecommendedDoctorsList,
    allDoctorsList,
    filteredDoctorsList,
    filterDoctorStatus,
    searchDoctorsList,
    searchDoctorStatus,
    displayedDoctorsList,
    checkedCityId,
    checkedSpecialityId,
    allSpecializationList,
    allSpecializationStatus,
  ];
}
