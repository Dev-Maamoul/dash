part of 'menu_cubit.dart';

@immutable
sealed class MenuState {}

final class MenuInitial extends MenuState {}

final class SuccessLoadingState extends MenuState {}

// final class SuccessState extends MenuState {}

final class LoadingState extends MenuState {}

final class UpdateViewState extends MenuState {}

final class ErrorState extends MenuState {
  final String msg;

  ErrorState({required this.msg});
}
