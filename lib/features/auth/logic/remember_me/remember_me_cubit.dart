import 'package:flutter_bloc/flutter_bloc.dart';

part 'remember_me_state.dart';

class RememberMeCubit extends Cubit<RememberMeState> {
  RememberMeCubit() : super(RememberMeInitial());

  bool isClick = false;
  void rememberMe() {
    isClick = !isClick;
    emit(RememberMeSuccess(isClick: isClick));
  }
}
