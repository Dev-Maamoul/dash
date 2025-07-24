import 'package:bloc/bloc.dart';
import 'package:dashboard/shared/api/network.dart';
import 'package:dashboard/shared/data_source/auth_locater.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  final authLocater = GetIt.I.get<AuthLocater>();
  String? otp = '574839';
  bool isEnable = false;
  VerifyCubit() : super(VerifyInitial()) {}

  Future<void> verify() async {
    try {
      emit(VerifyLoading());

      await authLocater.verifyLogin(otp: otp!);

      emit(VerifySuccess());
    } on ApiNetworkException catch (error) {
      emit(VerifyError(msg: error.message));
    } catch (error) {
      emit(VerifyError(msg: error.toString()));
    }
  }

  void enableButton({required String otpCode}) async {
    otp = otpCode;
    isEnable = otpCode.length == 6;

    await Future.delayed(Duration.zero);

    if (!isClosed) {
      emit(EnableUpdate(isEnable: isEnable));
    }
  }
}
