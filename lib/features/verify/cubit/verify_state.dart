part of 'verify_cubit.dart';

@immutable
sealed class VerifyState {}

final class VerifyInitial extends VerifyState {}

final class VerifySuccess extends VerifyState {}

final class VerifyLoading extends VerifyState {}

final class TestState extends VerifyState {}

final class EnableUpdate extends VerifyState {
  final bool isEnable;

  EnableUpdate({required this.isEnable});
}

final class BackState extends VerifyState {}

final class VerifyError extends VerifyState {
  final String msg;
  VerifyError({required this.msg});
}
