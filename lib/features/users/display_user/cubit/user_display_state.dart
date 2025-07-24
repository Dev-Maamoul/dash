part of 'user_display_cubit.dart';

@immutable
sealed class UserDisplayState {}

final class UserDisplayInitial extends UserDisplayState {}
final class LoadOrdersSuccess extends UserDisplayState {}
