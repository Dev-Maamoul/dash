import 'package:bloc/bloc.dart';
import 'package:dashboard/features/drivers/drivers_screen.dart';
import 'package:dashboard/features/home/home_screen.dart';
import 'package:dashboard/features/orders/orders_screen.dart';
import 'package:dashboard/features/stores/stores/stores_screen.dart';
import 'package:dashboard/features/users/users/users_screen.dart';
import 'package:dashboard/shared/data_source/dataLocater.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  final authLocater = GetIt.I.get<DataLocater>();
  int index = 0;
  int selectIndex = 0;
  List views = [
    HomeScreen(),
    StoreScreen(),
    UsersScreen(),
    DriversScreen(),
    OrdersScreen(),
  ];
  MenuCubit() : super(MenuInitial());

  Future<void> loadData() async {
    try {
      if (!isClosed) {
        emit(LoadingState());
      }
      await authLocater.loadData();
      if (!isClosed) {
        emit(SuccessLoadingState());
      }
    } on FormatException catch (error) {
      if (!isClosed) {
        emit(ErrorState(msg: error.message));
      }
    } catch (error) {
      if (!isClosed) {
        emit(ErrorState(msg: error.toString()));
      }
    }
  }

  void changePage({required int index}) {
    selectIndex = index;
    if (!isClosed) {
      emit(UpdateViewState());
    }
  }
}
