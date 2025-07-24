import 'package:dashboard/shared/api/endpoint/api_endpoints.dart';
import 'package:dashboard/shared/api/models/response.dart';
import 'package:dashboard/shared/api/network.dart';
import 'package:dio/dio.dart';

class StoreMethodsApi {
  final ApiEndpoints _endpoint = ApiEndpoints();

  Future<ResponseData> analyses({required String token}) async {
    try {
      final response = await _endpoint.dio!.get(
        _endpoint.analysesEndPoint,
        options: Options(
          headers: {..._endpoint.headers, "Authorization": "Bearer $token"},
        ),
      );

      return ResponseData.fromJson(response.data);
    } on DioException catch (error) {
      throw ApiNetworkException(error.response?.data["message"]);
    } catch (error) {
      throw ApiNetworkException("There arroe with api");
    }
  }

  ///
  ///
  ///
  ///
  ///

  Future<ResponseData> getAllStores({required String token}) async {
    try {
      final response = await _endpoint.dio!.get(
        _endpoint.allStoresEndPoint,
        options: Options(
          headers: {..._endpoint.headers, "Authorization": "Bearer $token"},
        ),
      );

      return ResponseData.fromJson(response.data);
    } on DioException catch (error) {
      throw ApiNetworkException(error.response?.data["message"]);
    } catch (error) {
      throw ApiNetworkException("There arroe with api");
    }
  }

  ///
  ///
  ///
  ///
  ///
  ///
  Future<ResponseData> getAllProductsStore({
    required String token,
    required String storeID,
  }) async {
    try {
      final response = await _endpoint.dio!.get(
        _endpoint.getAllProductsStoreByID + storeID,
        options: Options(
          headers: {..._endpoint.headers, "Authorization": "Bearer $token"},
        ),
      );

      return ResponseData.fromJson(response.data);
    } on DioException catch (error) {
      throw ApiNetworkException(error.response?.data["message"]);
    } catch (error) {
      throw ApiNetworkException("There arroe with api");
    }
  }

  ///
  ///
  ///
  ///
  ///
  ///
  Future<ResponseData> getAllRevenuesPaymentsStore({
    required String token,
    required String storeID,
  }) async {
    try {
      final response = await _endpoint.dio!.get(
        _endpoint.getAllRevenuesPaymentsStore + storeID,
        options: Options(
          headers: {..._endpoint.headers, "Authorization": "Bearer $token"},
        ),
      );

      return ResponseData.fromJson(response.data);
    } on DioException catch (error) {
      throw ApiNetworkException(error.response?.data["message"]);
    } catch (error) {
      throw ApiNetworkException("There arroe with api");
    }
  }

  ///
  ///
  ///
  ///
  ///
  ///
  Future<ResponseData> changeStatusStore({
    required String token,
    required String storeID,
    required StatusStore status,
  }) async {
    try {
      print(token);
      final response = await _endpoint.dio!.put(
        _endpoint.acceptStore + storeID,
        options: Options(
          headers: {..._endpoint.headers, "Authorization": "Bearer $token"},
        ),
        data: {"status": status.name.toString().toLowerCase()},
      );
      print("----------here---------");
      return ResponseData.fromJson(response.data);
    } on DioException catch (error) {
      print("----------error Dio:${error.response}---------");
      print("----------error Dio err:${error.error}---------");
      throw ApiNetworkException(error.response?.data["message"]);
    } catch (error) {
      print("----------error :$error---------");

      throw ApiNetworkException("There arroe with api");
    }
  }

  ///
  ///
  ///
  ///
  ///
  ///
  Future<ResponseData> getOrdersStore({
    required String token,
    required String storeID,
  }) async {
    try {
      print(token);
      final response = await _endpoint.dio!.get(
        _endpoint.getOrdersStore + storeID,
        options: Options(
          headers: {..._endpoint.headers, "Authorization": "Bearer $token"},
        ),
      );
      print("----------here---------");
      return ResponseData.fromJson(response.data);
    } on DioException catch (error) {
      print("----------error Dio:${error.response}---------");
      print("----------error Dio err:${error.error}---------");
      throw ApiNetworkException(error.response?.data["message"]);
    } catch (error) {
      print("----------error :$error---------");

      throw ApiNetworkException("There arroe with api");
    }
  }

  ///
  ///
  ///
  ///
  ///
  ///
  Future<ResponseData> getUsers({required String token}) async {
    try {
      print(token);
      final response = await _endpoint.dio!.get(
        _endpoint.getUsers,
        options: Options(
          headers: {..._endpoint.headers, "Authorization": "Bearer $token"},
        ),
      );
      print("----------here---------");
      return ResponseData.fromJson(response.data);
    } on DioException catch (error) {
      print("----------error Dio:${error.response}---------");
      print("----------error Dio err:${error.error}---------");
      throw ApiNetworkException(error.response?.data["message"]);
    } catch (error) {
      print("----------error :$error---------");

      throw ApiNetworkException("There arroe with api");
    }
  }

  ///
  ///
  ///
  ///
  ///
  ///
  Future<ResponseData> getDriver({required String token}) async {
    try {
      print(token);
      final response = await _endpoint.dio!.get(
        _endpoint.getDrivers,
        options: Options(
          headers: {..._endpoint.headers, "Authorization": "Bearer $token"},
        ),
      );
      print("----------here---------");
      return ResponseData.fromJson(response.data);
    } on DioException catch (error) {
      print("----------error Dio:${error.response}---------");
      print("----------error Dio err:${error.error}---------");
      throw ApiNetworkException(error.response?.data["message"]);
    } catch (error) {
      print("----------error :$error---------");

      throw ApiNetworkException("There arroe with api");
    }
  }

  ///
  ///
  ///
  ///
  ///
  ///
  Future<ResponseData> getOrders({required String token}) async {
    try {
      print(token);
      final response = await _endpoint.dio!.get(
        _endpoint.getOrders,
        options: Options(
          headers: {..._endpoint.headers, "Authorization": "Bearer $token"},
        ),
      );
      print("----------here---------");
      return ResponseData.fromJson(response.data);
    } on DioException catch (error) {
      print("----------error Dio:${error.response}---------");
      print("----------error Dio err:${error.error}---------");
      throw ApiNetworkException(error.response?.data["message"]);
    } catch (error) {
      print("----------error :$error---------");

      throw ApiNetworkException("There arroe with api");
    }
  }

  ///
  ///
  ///
  ///
  ///
  ///
  Future<ResponseData> getOrdersUser({
    required String token,
    required String userID,
  }) async {
    try {
      print(token);
      final response = await _endpoint.dio!.get(
        _endpoint.getOrdersUser + userID,
        options: Options(
          headers: {..._endpoint.headers, "Authorization": "Bearer $token"},
        ),
      );
      print("----------here---------");
      return ResponseData.fromJson(response.data);
    } on DioException catch (error) {
      print("----------error Dio:${error.response}---------");
      print("----------error Dio err:${error.error}---------");
      throw ApiNetworkException(error.response?.data["message"]);
    } catch (error) {
      print("----------error :$error---------");

      throw ApiNetworkException("There arroe with api");
    }
  }
}

enum StatusStore { active, reject, processing, closed, suspended, block }
