class EndPoints {
  static const baseUrl = "https://vcare.integration25.com/api";
  static const register = "/auth/register";
  static const login = "/auth/login";
  static const userProfile = "/user/profile";
  static const updateProfile = "/user/update";
  static const allSpecializations = "/specialization/index";
  static const homeRecommendedDoctor = "/home/index";
  static const allDoctors = "/doctor/index";
  static String filterDoctorsByCity(int id) => "/doctor/doctor-filter?city=$id";
  static String filterDoctorsBySpeciality(int id) =>
      "/doctor/doctor-filter?specialization=$id";
  static String searchDoctors(String name) =>
      "/doctor/doctor-search?name=$name";
}
