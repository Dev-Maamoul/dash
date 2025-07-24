import 'dart:async';

import 'package:dashboard/shared/api/network.dart';
import 'package:dashboard/shared/data_source/auth_locater.dart';
import 'package:dashboard/shared/models/all_stores_model.dart';
import 'package:dashboard/shared/models/analyses_model.dart';
import 'package:dashboard/shared/models/driver_model.dart';
import 'package:dashboard/shared/models/order_model.dart';
import 'package:dashboard/shared/models/users_model.dart';

import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

class DataLocater {
  final box = GetStorage();
  NetworkProvider api = NetworkProvider();
  AuthLocater authLocater = GetIt.I.get<AuthLocater>();
  AnalysesModel? analysesData;
  List<StoreModel> stores = [];
  List<UserModel> clintUsers = [];
  List<DriverModel> drivers = [];
  List<OrdersModel> orders = [];

  final StreamController<String> _controller =
      StreamController<String>.broadcast();
  Stream<String> get stream => _controller.stream;

  DataLocater() {
    loadData();
  }

  ///
  ///
  ///

  Future<void> getAnalyses() async {
    try {
      final response = await api.storeMethods.analyses(
        token: authLocater.verifyData!.token,
      );
      analysesData = AnalysesModel.fromJson(response.dataSours);
      _controller.sink.add("event");
    } on ApiNetworkException catch (error) {
      throw FormatException(error.message);
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

  ///
  ///
  ///

  Future<void> getAllStores() async {
    try {
      final response = await api.storeMethods.getAllStores(
        token: authLocater.verifyData!.token,
      );
      stores = List.from(
        response.dataSours ?? [],
      ).map((item) => StoreModel.fromJson(item)).toList();
      print(stores);
    } on ApiNetworkException catch (error) {
      print(error);
      throw FormatException(error.message);
    } catch (error) {
      print(error);

      throw FormatException(error.toString());
    }
  }

  ///
  ///
  ///

  Future<void> getAllUsers() async {
    try {
      final response = await api.storeMethods.getUsers(
        token: authLocater.verifyData!.token,
      );
      clintUsers = List.from(
        response.dataSours ?? [],
      ).map((item) => UserModel.fromJson(item)).toList();
      print("users loadd ++");
    } on ApiNetworkException catch (error) {
      print(error);
      throw FormatException(error.message);
    } catch (error) {
      print(error);

      throw FormatException(error.toString());
    }
  }

  ///
  ///
  ///

  Future<void> getAllUDrivers() async {
    try {
      final response = await api.storeMethods.getDriver(
        token: authLocater.verifyData!.token,
      );
      drivers = List.from(
        response.dataSours ?? [],
      ).map((item) => DriverModel.fromJson(item)).toList();
      print("users loadd ++");
    } on ApiNetworkException catch (error) {
      print(error);
      throw FormatException(error.message);
    } catch (error) {
      print(error);

      throw FormatException(error.toString());
    }
  }

  ///
  ///
  ///

  Future<void> getAllUOrders() async {
    try {
      final response = await api.storeMethods.getOrders(
        token: authLocater.verifyData!.token,
      );
      orders = List.from(
        response.dataSours ?? [],
      ).map((item) => OrdersModel.fromJson(item)).toList();
      print("users loadd ++");
    } on ApiNetworkException catch (error) {
      print(error);
      throw FormatException(error.message);
    } catch (error) {
      print(error);

      throw FormatException(error.toString());
    }
  }

  ///
  ///
  ///

  Future<void> loadData() async {
    await getAnalyses();
    await getAllStores();
    await getAllUsers();
    await getAllUDrivers();
    await getAllUOrders();
  }
}
