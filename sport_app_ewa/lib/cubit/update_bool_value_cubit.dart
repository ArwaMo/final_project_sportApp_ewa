import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'update_bool_value_state.dart';

class UpdateBoolValueCubit extends Cubit<UpdateBoolValueState> {
  UpdateBoolValueCubit() : super(UpdateBoolValueInitial());

  updateValue(bool value) {
    bool result = value = !value;
    emit(UpdateBoolValueSuccess(result));
  }
}
