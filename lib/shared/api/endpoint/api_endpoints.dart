import 'package:dio/dio.dart';

class ApiEndpoints {
  Dio? dio;
  Map<String, dynamic> headers = {};

  final String accountEndPoint = '/v1/auth/create/account';
  final String loginEndPoint = '/v1/auth/login';
  final String verifyEndPoint = '/v1/auth/verify';
  final String analysesEndPoint = '/v1/admin/get/analyses';
  final String allStoresEndPoint = '/v1/admin/get/stores';
  final String getAllProductsStoreByID = '/v1/admin/get/products/store/';
  final String getAllRevenuesPaymentsStore = '/v1/admin/get/revenues/payments/';
  final String acceptStore = '/v1/admin/accept/stores/';
  final String getOrdersStore = '/v1/admin/get/orders/store/';
  final String getUsers = '/v1/admin/get/users';
  final String getDrivers = '/v1/admin/get/drivers';
  final String getOrders = '/v1/admin/get/orders';
  final String getOrdersUser = '/v1/admin/get/orders/user/';

  ApiEndpoints() {
    headers = {'Content-Type': 'application/json'};

    dio = Dio(
      BaseOptions(
        // baseUrl: 'http://0.0.0.0:8081',
        baseUrl: 'https://dev-api-mqhf.onrender.com',

        headers: headers,
        connectTimeout: Duration(seconds: 15),
        receiveTimeout: Duration(seconds: 15),
      ),
    );
  }
}
