part of 'store_display_cubit.dart';

@immutable
sealed class StoreDisplayState {}

final class StoreDisplayInitial extends StoreDisplayState {}

final class UpdateState extends StoreDisplayState {}

final class LoadProductState extends StoreDisplayState {}

final class SuccessProductState extends StoreDisplayState {}

final class UpdateSelected extends StoreDisplayState {}
