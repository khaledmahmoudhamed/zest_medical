import 'package:dartz/dartz.dart';
import 'package:zest_medical/core/network/web_services.dart';
import 'package:zest_medical/data/models/doctor/all_doctors_model.dart';
import 'package:zest_medical/data/models/home_model/home_recommended_model.dart';
import '../../../core/network/end_points.dart';
import '../../../core/utils/app_functions.dart';

class DoctorRepo {
  final WebServices webServices;

  DoctorRepo({required this.webServices});

  Future<Either<String, HomeDoctorsModel>> getAllSpecializations() async {
    try {
      final response = await webServices.get(EndPoints.allSpecializations);
      final doctorData = HomeDoctorsModel.fromJson(response);
      return right(doctorData);
    } on ServerExceptions catch (e) {
      return left(e.errorModel.message);
    }
  }

  Future<Either<String, AllDoctorsModel>> getAllDoctors() async {
    try {
      final response = await webServices.get(EndPoints.allDoctors);
      final allDoctors = AllDoctorsModel.fromJson(response);
      return right(allDoctors);
    } on ServerExceptions catch (e) {
      return left(e.errorModel.message);
    }
  }

  List<Map<String, dynamic>> getDiseasesImages() {
    return [
      {'name': 'General', "image": "assets/diseases/general.png"},
      {'name': 'Neurology', "image": "assets/diseases/neurology.png"},
      {'name': 'Pediatrics', "image": "assets/diseases/pediatric.png"},
      {'name': 'Dermatology', "image": "assets/diseases/dermatology.png"},
      {'name': 'Cardiology', "image": "assets/diseases/cardiology.png"},
      {'name': 'Orthopedics', "image": "assets/diseases/arthritis.png"},
      {'name': 'Gynecology', "image": "assets/diseases/maternity.png"},
      {'name': 'Ophthalmology', "image": "assets/diseases/ophthalmology.png"},
      {'name': 'Urology', "image": "assets/diseases/kidney.png"},
      {
        'name': 'Gastroenterology',
        "image": "assets/diseases/gastroenterology.png",
      },
      {'name': 'Psychiatry', "image": "assets/diseases/psychiatry.png"},
    ];
  }

  Future<Either<String, HomeDoctorsModel>> homeRecommendedDoctors() async {
    try {
      final response = await webServices.get(EndPoints.homeRecommendedDoctor);
      final homeDoctor = HomeDoctorsModel.fromJson(response);
      return right(homeDoctor);
    } on ServerExceptions catch (e) {
      return left(e.errorModel.message);
    }
  }

  Future<Either<String, AllDoctorsModel>> filterByCity(int id) async {
    try {
      final response = await webServices.get(EndPoints.filterDoctorsByCity(id));
      final filterResponse = AllDoctorsModel.fromJson(response);
      return right(filterResponse);
    } on ServerExceptions catch (e) {
      return left(e.errorModel.message);
    }
  }

  Future<Either<String, AllDoctorsModel>> filterBySpeciality(int id) async {
    try {
      final response = await webServices.get(
        EndPoints.filterDoctorsBySpeciality(id),
      );
      final filterResponse = AllDoctorsModel.fromJson(response);
      return right(filterResponse);
    } on ServerExceptions catch (e) {
      return left(e.errorModel.message);
    }
  }

  Future<Either<String, AllDoctorsModel>> searchDoctors(String name) async {
    try {
      final response = await webServices.get(EndPoints.searchDoctors(name));
      final filterResponse = AllDoctorsModel.fromJson(response);
      return right(filterResponse);
    } on ServerExceptions catch (e) {
      return left(e.errorModel.message);
    }
  }
}
