import 'package:equatable/equatable.dart';
import 'package:zest_medical/data/models/user_model/message_model.dart';
import '../../data/models/home_model/doctor_info.dart';
import '../../data/models/home_model/home_data_model.dart';

enum DoctorStatus { initial, loading, loaded, failed }

class DoctorState extends Equatable {
  final List<DoctorData> allSpecializationList;
  final List<Doctors> homeRecommendedDoctorsList;
  final List<Doctors> chatDoctorsList;
  final List<Doctors> allDoctorsList;
  final List<Doctors> filteredChatDoctorsList;
  final List<Doctors> searchDoctorsList;
  final List<Doctors> displayedRecommendedDoctorsList;
  final List<Doctors> createMessageList;
  final List<MessageModel> messageList;
  final List<Doctors> searchDoctor;
  final DoctorStatus homeStatus;
  final DoctorStatus recommendedDoctorStatus;
  final DoctorStatus filterByCityStatus;
  final DoctorStatus filterBySpecialityStatus;
  final DoctorStatus searchDoctorStatus;
  final DoctorStatus allSpecializationStatus;
  final DoctorStatus chatDoctorStatus;
  final DoctorStatus createMessageStatus;
  final String? error;
  final String? searchQuery;
  final int checkedCityId;
  final int? checkedSpecialityId;

  const DoctorState({
    this.error,
    this.allDoctorsList = const [],
    this.homeRecommendedDoctorsList = const [],
    this.filteredChatDoctorsList = const [],
    this.searchDoctorsList = const [],
    this.displayedRecommendedDoctorsList = const [],
    this.allSpecializationList = const [],
    this.chatDoctorsList = const [],
    this.messageList = const [],
    this.createMessageList = const [],
    this.searchDoctor = const [],
    this.homeStatus = DoctorStatus.initial,
    this.recommendedDoctorStatus = DoctorStatus.initial,
    this.filterByCityStatus = DoctorStatus.initial,
    this.filterBySpecialityStatus = DoctorStatus.initial,
    this.searchDoctorStatus = DoctorStatus.initial,
    this.chatDoctorStatus = DoctorStatus.initial,
    this.createMessageStatus = DoctorStatus.initial,
    this.checkedCityId = 36,
    this.checkedSpecialityId = 9,
    this.allSpecializationStatus = DoctorStatus.initial,
    this.searchQuery,
  });

  DoctorState copyWith({
    List<Doctors>? homeRecommendedDoctorsList,
    List<DoctorData>? allSpecializationList,
    List<Doctors>? allDoctorsList,
    List<Doctors>? filteredChatDoctorsList,
    List<Doctors>? searchDoctorsList,
    List<Doctors>? displayedRecommendedDoctorsList,
    List<Doctors>? chatDoctorsList,
    List<Doctors>? createMessageList,
    List<MessageModel>? messageList,
    List<Doctors>? searchDoctor,
    DoctorStatus? homeStatus,
    DoctorStatus? recommendedDoctorStatus,
    DoctorStatus? filterByCityStatus,
    DoctorStatus? filterBySpecialityStatus,
    DoctorStatus? searchDoctorStatus,
    DoctorStatus? allSpecializationStatus,
    DoctorStatus? chatDoctorStatus,
    DoctorStatus? createMessageStatus,
    String? error,
    String? searchQuery,
    int? checkedCityId,
    int? checkedSpecialityId,
  }) {
    return DoctorState(
      error: error ?? this.error,
      searchQuery: searchQuery ?? this.searchQuery,
      homeRecommendedDoctorsList:
          homeRecommendedDoctorsList ?? this.homeRecommendedDoctorsList,
      allDoctorsList: allDoctorsList ?? this.allDoctorsList,
      homeStatus: homeStatus ?? this.homeStatus,
      recommendedDoctorStatus:
          recommendedDoctorStatus ?? this.recommendedDoctorStatus,
      filteredChatDoctorsList:
          filteredChatDoctorsList ?? this.filteredChatDoctorsList,
      allSpecializationList:
          allSpecializationList ?? this.allSpecializationList,
      filterByCityStatus: filterByCityStatus ?? this.filterByCityStatus,
      filterBySpecialityStatus:
          filterBySpecialityStatus ?? this.filterBySpecialityStatus,
      searchDoctorsList: searchDoctorsList ?? this.searchDoctorsList,
      searchDoctorStatus: searchDoctorStatus ?? this.searchDoctorStatus,
      allSpecializationStatus:
          allSpecializationStatus ?? this.allSpecializationStatus,
      displayedRecommendedDoctorsList:
          displayedRecommendedDoctorsList ??
          this.displayedRecommendedDoctorsList,
      checkedCityId: checkedCityId ?? this.checkedCityId,
      checkedSpecialityId: checkedSpecialityId ?? this.checkedSpecialityId,
      chatDoctorsList: chatDoctorsList ?? this.chatDoctorsList,
      chatDoctorStatus: chatDoctorStatus ?? this.chatDoctorStatus,
      messageList: messageList ?? this.messageList,
      createMessageList: createMessageList ?? this.createMessageList,
      createMessageStatus: createMessageStatus ?? this.createMessageStatus,
      searchDoctor: searchDoctor ?? this.searchDoctor,
    );
  }

  @override
  List<Object?> get props => [
    error,
    recommendedDoctorStatus,
    homeStatus,
    homeRecommendedDoctorsList,
    allDoctorsList,
    filteredChatDoctorsList,
    filterByCityStatus,
    searchDoctorsList,
    searchDoctorStatus,
    displayedRecommendedDoctorsList,
    checkedCityId,
    checkedSpecialityId,
    allSpecializationList,
    allSpecializationStatus,
    chatDoctorsList,
    chatDoctorStatus,
    messageList,
    createMessageList,
    createMessageStatus,
    searchDoctor,
    searchQuery,
    filterBySpecialityStatus,
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
    filteredChatDoctorsList,
    filterByCityStatus,
    searchDoctorsList,
    searchDoctorStatus,
    displayedRecommendedDoctorsList,
    checkedCityId,
    checkedSpecialityId!,
    allSpecializationList,
    allSpecializationStatus,
    chatDoctorsList,
    chatDoctorStatus,
    messageList,
    createMessageList,
    createMessageStatus,
    searchDoctor,
    filterBySpecialityStatus,
    searchQuery!,
  ];
}
