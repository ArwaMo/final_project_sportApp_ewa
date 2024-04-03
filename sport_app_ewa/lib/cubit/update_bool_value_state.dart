part of 'update_bool_value_cubit.dart';

@immutable
sealed class UpdateBoolValueState {}

final class UpdateBoolValueInitial extends UpdateBoolValueState {}

final class UpdateBoolValueSuccess extends UpdateBoolValueState {
  final bool value;
  UpdateBoolValueSuccess(this.value);
}
