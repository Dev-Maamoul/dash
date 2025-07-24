import 'package:bloc/bloc.dart';
import 'package:dashboard/shared/api/network.dart';
import 'package:dashboard/shared/data_source/auth_locater.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final authLocater = GetIt.I.get<AuthLocater>();

  final TextEditingController mobileController = TextEditingController(
    text: '966501231207',
  );
  LoginCubit() : super(LoginInitial());

  Future<void> login() async {
    try {
      emit(LoginLoading());
      await authLocater.login(mobile: mobileController.text);
      emit(LoginSuccess());
    } on FormatException catch (error) {
      emit(LoginError(msg: error.message));
    } catch (error) {
      emit(LoginError(msg: error.toString()));
    }
  }
}
