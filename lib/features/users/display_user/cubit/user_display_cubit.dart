import 'package:bloc/bloc.dart';
import 'package:dashboard/shared/data_source/auth_locater.dart';
import 'package:dashboard/shared/data_source/dataLocater.dart';
import 'package:dashboard/shared/models/order_model.dart';
import 'package:dashboard/shared/models/users_model.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'user_display_state.dart';

class UserDisplayCubit extends Cubit<UserDisplayState> {
  UserModel? user;
  final authLocater = GetIt.I.get<AuthLocater>();
  final dataLocater = GetIt.I.get<DataLocater>();
  List<OrdersModel> orders = [];
  UserDisplayCubit() : super(UserDisplayInitial());
  Set<String> statusLabel = {};
  Map dataChar = {};

  Future<void> loadOrders() async {
    orders.clear();
    final x = await dataLocater.api.storeMethods.getOrdersUser(
      token: authLocater.verifyData!.token,
      userID: user!.id!,
    );
    List.from(
      x.dataSours,
    ).map((item) => orders.add(OrdersModel.fromJson(item))).toList();

    orders.map((item) {
      statusLabel.add(item.status);
    }).toList();

    if (!isClosed) {
      emit(LoadOrdersSuccess());
    }
  }
}
