import 'package:dashboard/shared/api/endpoint/api_endpoints.dart';
import 'package:dashboard/shared/api/models/response.dart';
import 'package:dashboard/shared/api/network.dart';
import 'package:dio/dio.dart';

 class AuthMethodsApi {
  final ApiEndpoints _endpoint = ApiEndpoints();

  Future<ResponseData> login({required String mobile}) async {
    try {
      final phone = normalizeSaudiMobile(mobile.trim());
      print(phone);
      final response = await _endpoint.dio!.post(
        _endpoint.loginEndPoint,
        data: {"mobile": "966$phone"},
      );

      return ResponseData.fromJson(response.data);
    } on DioException catch (error) {
      throw ApiNetworkException(error.response?.data["message"]);
    } catch (error) {
      throw ApiNetworkException("There arroe with api");
    }
  }

  //---
  Future<ResponseData> verifyLogin({
    required String mobile,
    required String otp,
  }) async {
    try {
      final phone = normalizeSaudiMobile(mobile.trim());
      print(phone);
      final response = await _endpoint.dio!.post(
        _endpoint.verifyEndPoint,
        data: {
          "mobile": "966$phone",
          "otp": otp,
          "id_notification": "asdfasdf32",
        },
      );

      return ResponseData.fromJson(response.data);
    } on DioException catch (error) {
      throw ApiNetworkException(error.response?.data["message"]);
    } catch (error) {
      throw ApiNetworkException("There arroe with api");
    }
  }
}
