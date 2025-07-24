part of 'stores_cubit.dart';

@immutable
sealed class StoresState {}

final class StoresInitial extends StoresState {}

final class UpdateStoreState extends StoresState {}
