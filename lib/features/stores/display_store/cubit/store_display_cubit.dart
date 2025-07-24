import 'package:bloc/bloc.dart';
import 'package:dashboard/shared/api/methods/store_methods%20.dart';
import 'package:dashboard/shared/api/network.dart';
import 'package:dashboard/shared/data_source/auth_locater.dart';
import 'package:dashboard/shared/data_source/dataLocater.dart';
import 'package:dashboard/shared/models/all_stores_model.dart';
import 'package:dashboard/shared/models/order_model.dart';
import 'package:dashboard/shared/models/product_model.dart';
import 'package:dashboard/shared/models/revenues_payments_store_model.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'store_display_state.dart';

enum SelectType { orders, products }

class StoreDisplayCubit extends Cubit<StoreDisplayState> {
  StoreModel? storeData;
  NetworkProvider api = NetworkProvider();
  final authLocater = GetIt.I.get<AuthLocater>();
  final dataLocater = GetIt.I.get<DataLocater>();
  List<ProductModel> products = [];
  RevenuesPaymentsStoreModel revenuesPaymentsStore = RevenuesPaymentsStoreModel(
    maamoulProfit: 0,
    storeProfit: 0,
    total: 0,
  );
  SelectType selectedOption = SelectType.products;
  List<OrdersModel> ordersStore = [];

  StoreDisplayCubit() : super(StoreDisplayInitial());
  Future<void> loadProducts({required String id}) async {
    products = [];
    final x = await api.storeMethods.getAllProductsStore(
      token: authLocater.verifyData!.token,
      storeID: id,
    );
    List.from(
      x.dataSours,
    ).map((item) => products.add(ProductModel.fromJson(item))).toList();
    await Future.delayed(Duration(milliseconds: 100));
  }

  Future<void> loadRevenuesPayments({required String id}) async {
    emit(LoadProductState());
    final x = await api.storeMethods.getAllRevenuesPaymentsStore(
      token: authLocater.verifyData!.token,
      storeID: id,
    );
    revenuesPaymentsStore = RevenuesPaymentsStoreModel.fromJson(x.dataSours);
  }

  @override
  Future<void> close() {
    products = [];
    return super.close();
  }

  void startLoadData({required String idStore}) async {
    emit(LoadProductState());
    await Future.wait([
      loadProducts(id: idStore),
      loadRevenuesPayments(id: idStore),
      loadOrderStore(),
    ]);
    if (!isClosed) {
      emit(SuccessProductState());
    }
  }

  void changeStatus({
    required String idStore,
    required StatusStore status,
  }) async {
    final x = await api.storeMethods.changeStatusStore(
      status: status,
      token: authLocater.verifyData!.token,
      storeID: idStore,
    );

    await dataLocater.getAllStores();

    startLoadData(idStore: idStore);
    storeData =
        dataLocater.stores.firstWhere(
              (element) => element.id.toString() == idStore,
            )
            as StoreModel?;

    emit(UpdateState());
  }

  void changeTypeDisplay({required SelectType selected}) {
    selectedOption = selected;
    emit(UpdateSelected());
    emit(UpdateState());
    emit(SuccessProductState());
  }

  Future<void> loadOrderStore() async {
    final x = await api.storeMethods.getOrdersStore(
      token: authLocater.verifyData!.token,
      storeID: storeData!.id.toString(),
    );
    List.from(
      x.dataSours,
    ).map((item) => ordersStore.add(OrdersModel.fromJson(item))).toList();
    await Future.delayed(Duration(milliseconds: 100));

    if (!isClosed) {}
  }
}
