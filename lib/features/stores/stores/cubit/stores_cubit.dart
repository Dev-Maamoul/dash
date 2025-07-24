import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dashboard/shared/data_source/dataLocater.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'stores_state.dart';

class StoresCubit extends Cubit<StoresState> {
  final authLocater = GetIt.I.get<DataLocater>();

  StoresCubit() : super(StoresInitial()) {
    // authLocater.stream.listen((value) {
    //   emit(UpdateStoreState());
    // });
  }
}
