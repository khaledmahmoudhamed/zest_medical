import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zest_medical/cache/hive.dart';
import 'package:zest_medical/data/models/user_model/message_model.dart';
import 'package:zest_medical/data/repositories/doctor_repo/doctor_repo.dart';
import 'package:zest_medical/logic/doctor_cubit/doctor_state.dart';

import '../../data/models/home_model/doctor_info.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit({required this.appRepo}) : super(InitialDoctorState());

  final DoctorRepo appRepo;

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

  Future<void> getAllSpecializations() async {
    if (state.allSpecializationList.isNotEmpty) return;
    emit(state.copyWith(allSpecializationStatus: DoctorStatus.loading));
    final response = await appRepo.getAllSpecializations();
    response.fold(
      (error) {
        emit(
          state.copyWith(
            error: error,
            allSpecializationStatus: DoctorStatus.failed,
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            allSpecializationList: success.doctorData,
            allSpecializationStatus: DoctorStatus.loaded,
          ),
        );
      },
    );
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
            displayedRecommendedDoctorsList: success.doctorData,
            recommendedDoctorStatus: DoctorStatus.loaded,
          ),
        );
      },
    );
  }

  Future<void> filterDoctorsByCity(int id) async {
    emit(state.copyWith(filterByCityStatus: DoctorStatus.loading));
    final response = await appRepo.filterByCity(id);
    response.fold(
      (error) {
        emit(
          state.copyWith(filterByCityStatus: DoctorStatus.failed, error: error),
        );
      },
      (success) {
        emit(
          state.copyWith(
            filterByCityStatus: DoctorStatus.loaded,
            displayedRecommendedDoctorsList: success.doctorData,
            checkedCityId: id,
          ),
        );
      },
    );
  }

  Future<void> filterDoctorsBySpeciality(int? id) async {
    emit(state.copyWith(filterByCityStatus: DoctorStatus.loading));
    final response = await appRepo.filterBySpeciality(id!);
    response.fold(
      (error) {
        emit(
          state.copyWith(filterByCityStatus: DoctorStatus.failed, error: error),
        );
      },
      (success) {
        emit(
          state.copyWith(
            filterByCityStatus: DoctorStatus.loaded,
            displayedRecommendedDoctorsList: success.doctorData,
            checkedSpecialityId: id,
          ),
        );
      },
    );
  }

  Future<void> searchDoctors(String name) async {
    if (name.isEmpty) {
      emit(
        state.copyWith(displayedRecommendedDoctorsList: state.allDoctorsList),
      );
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
            displayedRecommendedDoctorsList: success.doctorData,
          ),
        );
      },
    );
  }

  List<MessageModel> chatMessages = [];
  final List<String> doctorReplies = [
    "Hello! I received your message. How can I help you today?",
    "I've noted your symptoms. Could you tell me more about when this started?",
    "Thank you for reaching out. Please wait a moment while I review your profile.",
    "I'm here to help. Are you currently taking any medication for this?",
    "Understood. Let's look into this further together.",
  ];
  int messageCounter = 0;
  void sendMessage(String text) async {
    final userMsg = MessageModel(
      dateTime: DateTime.now(),
      text: text,
      isMe: true,
      isImage: false,
    );
    chatMessages.insert(0, userMsg);
    // CacheHelper.chatMessages!.add(userMsg);
    emit(state.copyWith(messageList: List.from(chatMessages)));

    Timer(Duration(seconds: 2), () async {
      if (messageCounter < doctorReplies.length) {
        final docMsg = MessageModel(
          dateTime: DateTime.now(),
          text: doctorReplies[messageCounter],
          isMe: false,
          isImage: false,
        );
        chatMessages.insert(0, docMsg);
        //  CacheHelper.chatMessages!.add(docMsg);
        emit(state.copyWith(messageList: List.from(chatMessages)));
        messageCounter++;
      } else {
        print("=========================End of prepared conversation flow. ");
      }
    });
  }

  ImagePicker picker = ImagePicker();

  void openGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final imagMsg = MessageModel(
        dateTime: DateTime.now(),
        text: image.path,
        isMe: true,
        isImage: true,
      );
      chatMessages.insert(0, imagMsg);
      emit(state.copyWith(chatDoctorsList: List.from(chatMessages)));
    }
  }
}
