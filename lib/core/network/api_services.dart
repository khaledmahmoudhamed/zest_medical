abstract class ApiServices {
  Future<dynamic> post(
    String endPoint, {
    Map<String, dynamic> queryParameters,
    Object? data,
  });
  Future<dynamic> get(
    String endPoint, {
    Map<String, dynamic> queryParameters,
    Object? data,
  });
}
